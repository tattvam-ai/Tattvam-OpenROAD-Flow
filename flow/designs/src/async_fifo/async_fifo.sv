module async_fifo #(
    parameter DATA_WIDTH = 8,      // Width of each FIFO entry
    parameter ADDR_WIDTH = 3,      // Address width (log2 of DEPTH)
    parameter DEPTH      = 8       // Number of FIFO entries
)(
    input  logic                  write_clk,   // Write domain clock
    input  logic                  read_clk,    // Read domain clock
    input  logic                  reset_n,     // Active-low reset
    input  logic                  write_en,    // Write enable
    input  logic                  read_en,     // Read enable
    input  logic [DATA_WIDTH-1:0] data_in,     // Data input
    output logic                  mem_full,    // FIFO full flag
    output logic                  mem_empty,   // FIFO empty flag
    output logic [DATA_WIDTH-1:0] data_out     // Data output
);

    // FIFO memory array
    logic [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    // Write and read pointers (one extra bit for full/empty detection)
    logic [ADDR_WIDTH:0] write_ptr, read_ptr;
    
    // Gray code pointers
    logic [ADDR_WIDTH:0] write_ptr_gray, read_ptr_gray;
    
    // Synchronized Gray code pointers
    logic [ADDR_WIDTH:0] sync_read_ptr_gray1, sync_read_ptr_gray2;
    logic [ADDR_WIDTH:0] sync_write_ptr_gray1, sync_write_ptr_gray2;

    // Binary to Gray code conversion
    function automatic logic [ADDR_WIDTH:0] bin2gray(logic [ADDR_WIDTH:0] bin);
        return bin ^ (bin >> 1);
    endfunction

    // Write pointer logic (write clock domain)
    always_ff @(posedge write_clk or negedge reset_n) begin
        if (!reset_n) begin
            write_ptr <= '0;
            write_ptr_gray <= '0;
        end else if (write_en && !mem_full) begin
            // Write to memory
            mem[write_ptr[ADDR_WIDTH-1:0]] <= data_in;
            // Update pointer
            write_ptr <= write_ptr + 1'b1;
            write_ptr_gray <= bin2gray(write_ptr + 1'b1);
        end
    end

    // Read pointer logic (read clock domain)
    always_ff @(posedge read_clk or negedge reset_n) begin
        if (!reset_n) begin
            read_ptr <= '0;
            read_ptr_gray <= '0;
            data_out <= '0;
        end else if (read_en && !mem_empty) begin
            // Read from memory using CURRENT pointer
            data_out <= mem[read_ptr[ADDR_WIDTH-1:0]];
            // Update pointer for next read
            read_ptr <= read_ptr + 1'b1;
            read_ptr_gray <= bin2gray(read_ptr + 1'b1);
        end
    end

    // Synchronize read pointer to write clock domain (for full detection)
    always_ff @(posedge write_clk or negedge reset_n) begin
        if (!reset_n) begin
            sync_read_ptr_gray1 <= '0;
            sync_read_ptr_gray2 <= '0;
        end else begin
            sync_read_ptr_gray1 <= read_ptr_gray;
            sync_read_ptr_gray2 <= sync_read_ptr_gray1;
        end
    end

    // Synchronize write pointer to read clock domain (for empty detection)
    always_ff @(posedge read_clk or negedge reset_n) begin
        if (!reset_n) begin
            sync_write_ptr_gray1 <= '0;
            sync_write_ptr_gray2 <= '0;
        end else begin
            sync_write_ptr_gray1 <= write_ptr_gray;
            sync_write_ptr_gray2 <= sync_write_ptr_gray1;
        end
    end

    // SIMPLIFIED Full and empty detection
    // Convert synchronized Gray codes back to binary for comparison
    function automatic logic [ADDR_WIDTH:0] gray2bin(logic [ADDR_WIDTH:0] gray);
        logic [ADDR_WIDTH:0] bin;
        bin = gray;
        for (int i = ADDR_WIDTH-1; i >= 0; i--) begin
            bin[i] = bin[i+1] ^ gray[i];
        end
        return bin;
    endfunction

    logic [ADDR_WIDTH:0] sync_write_ptr_bin, sync_read_ptr_bin;
    
    assign sync_write_ptr_bin = gray2bin(sync_write_ptr_gray2);
    assign sync_read_ptr_bin = gray2bin(sync_read_ptr_gray2);

    // Simple pointer comparison
    assign mem_empty = (read_ptr == sync_write_ptr_bin);
    assign mem_full  = ((write_ptr[ADDR_WIDTH-1:0] == sync_read_ptr_bin[ADDR_WIDTH-1:0]) &&
                       (write_ptr[ADDR_WIDTH] != sync_read_ptr_bin[ADDR_WIDTH]));

endmodule