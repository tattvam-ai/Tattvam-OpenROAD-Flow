// Optimized 8-bit ALU with pipelining
module pipelined_alu(
    input  wire        clk,
    input  wire        rst_n,
    input  wire [7:0]  a,
    input  wire [7:0]  b,
    input  wire [2:0]  op,      // operation selector
    input  wire        enable,  // enable signal
    output reg [7:0]   result
);

// Stage registers
reg [7:0] temp_reg1, temp_reg2;
reg [7:0] stage1;
reg [7:0] stage2;
reg [7:0] stage3;

// Stage 1: input arithmetic
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        temp_reg1 <= 8'd0;
        temp_reg2 <= 8'd0;
    end else if (enable) begin
        temp_reg1 <= a + b;   // addition
        temp_reg2 <= a - b;   // subtraction
    end
end

// Stage 2: ALU operations (pipelined)
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage1 <= 8'd0;
    end else begin
        case (op)
            3'b000: stage1 <= temp_reg1 + temp_reg2;
            3'b001: stage1 <= temp_reg1 - temp_reg2;
            3'b010: stage1 <= temp_reg1 & temp_reg2;
            3'b011: stage1 <= temp_reg1 | temp_reg2;
            3'b100: stage1 <= temp_reg1 ^ temp_reg2;
            default: stage1 <= 8'd0;
        endcase
    end
end

// Stage 3: add/sub constants (further pipelined)
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stage2 <= 8'd0;
        stage3 <= 8'd0;
    end else begin
        stage2 <= stage1 + 8'd5;
        stage3 <= stage2 - 8'd3;
    end
end

// Stage 4: output register
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        result <= 8'd0;
    end else begin
        result <= stage3;
    end
end

endmodule

