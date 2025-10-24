// Problematic 8-bit ALU
//Root cause in RTL:
//Multi-bit arithmetic without pipelining (temp_reg1 + temp_reg2).
//Case statement combinational logic for stage1 depends on multiple inputs.
//High fanout of enable propagates through all registers in the block (minor contributor).

module alu_8bit(
    input  wire        clk,
    input  wire        rst_n,
    input  wire [7:0]  a,
    input  wire [7:0]  b,
    input  wire [2:0]  op,      // operation selector
    input  wire        enable,  // high-fanout enable
    output reg [7:0]   result
);

reg [7:0] temp_reg1, temp_reg2;
reg [7:0] stage1, stage2, stage3; // multiple pipeline registers

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        temp_reg1 <= 8'd0;
        temp_reg2 <= 8'd0;
        stage1 <= 8'd0;
        stage2 <= 8'd0;
        stage3 <= 8'd0;
        result <= 8'd0;
    end else if (enable) begin
        // Poor RTL: long combinational chains + multiple assignments
        temp_reg1 <= a + b;
        temp_reg2 <= a - b;

        case (op)
            3'b000: stage1 <= temp_reg1 + temp_reg2;
            3'b001: stage1 <= temp_reg1 - temp_reg2;
            3'b010: stage1 <= temp_reg1 & temp_reg2;
            3'b011: stage1 <= temp_reg1 | temp_reg2;
            3'b100: stage1 <= temp_reg1 ^ temp_reg2;
            default: stage1 <= 8'd0;
        endcase

        // Additional poor practice: multi-stage combinational dependencies
        stage2 <= stage1 + 8'd5;
        stage3 <= stage2 - 8'd3;
        result <= stage3; // output depends on multiple stages
    end
end

endmodule

