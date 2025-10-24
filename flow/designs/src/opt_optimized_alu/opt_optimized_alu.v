module opt_optimized_alu(
    input  wire        clk,
    input  wire        rst_n,
    input  wire [7:0]  a,
    input  wire [7:0]  b,
    input  wire [2:0]  op,
    input  wire        enable,
    output reg [7:0]   result
);

reg [7:0] temp_reg1, temp_reg2;
reg [3:0] stage1_lo, stage1_hi;
reg        carry_lo;
reg [7:0] stage2, stage3;

// Stage registers for pipelining arithmetic
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        temp_reg1 <= 8'd0;
        temp_reg2 <= 8'd0;
        stage1_lo <= 4'd0;
        stage1_hi <= 4'd0;
        carry_lo  <= 1'b0;
        stage2 <= 8'd0;
        stage3 <= 8'd0;
        result <= 8'd0;
    end else if (enable) begin
        // Stage 0: compute temp results
        temp_reg1 <= a + b;
        temp_reg2 <= a - b;

        // Stage 1a: lower 4-bit adder
        case (op)
            3'b000: {carry_lo, stage1_lo} <= temp_reg1[3:0] + temp_reg2[3:0];
            3'b001: {carry_lo, stage1_lo} <= temp_reg1[3:0] - temp_reg2[3:0];
            3'b010: stage1_lo <= temp_reg1[3:0] & temp_reg2[3:0];
            3'b011: stage1_lo <= temp_reg1[3:0] | temp_reg2[3:0];
            3'b100: stage1_lo <= temp_reg1[3:0] ^ temp_reg2[3:0];
            default: stage1_lo <= 4'd0;
        endcase

        // Stage 1b: upper 4-bit adder with carry from lower
        case (op)
            3'b000: stage1_hi <= temp_reg1[7:4] + temp_reg2[7:4] + carry_lo;
            3'b001: stage1_hi <= temp_reg1[7:4] - temp_reg2[7:4] - carry_lo;
            3'b010: stage1_hi <= temp_reg1[7:4] & temp_reg2[7:4];
            3'b011: stage1_hi <= temp_reg1[7:4] | temp_reg2[7:4];
            3'b100: stage1_hi <= temp_reg1[7:4] ^ temp_reg2[7:4];
            default: stage1_hi <= 4'd0;
        endcase

        // Stage2: combine upper/lower
        stage2 <= {stage1_hi, stage1_lo};

        // Stage3: add minor offset
        stage3 <= stage2 + 8'd2;

        // Output
        result <= stage3;
    end
end

endmodule

