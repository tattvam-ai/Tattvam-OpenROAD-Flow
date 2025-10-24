// `include "../src/rca64.v"
// `include "../src/half_adder.v"
// `include "../src/vdcmul_32b.v"

module pipeline (
    x,        // input
    y,        // input
    clk,      // clock
    reset_n,  // active-low reset
    prod      // product
);

// Port declarations
input  [63:0]  x, y;       // 64-bit inputs
input           clk;        // clock
input           reset_n;    // active-low reset
output [127:0]  prod;       // 128-bit product

// Partial products
wire [63:0] pp1, pp2, pp3, pp4;

// Half-adder sum and carry
wire s1, ca1;

// RCA intermediate sum and carry registers
reg tempc1, tempc2, tempc3;
reg has, haca;

// RCA outputs
wire [63:0] sum1, sum2, sum3;

// Input registers
reg [63:0] xtemp, ytemp;

// Partial product registers
reg [63:0] temp1, temp2, temp3, temp4;

// Sum registers
reg [63:0] temps1, temps2, temps3;

// Temporary wires for RCAs
wire c1, c2, c3;

//-----------------------------------------------------
// Input pipeline registers
//-----------------------------------------------------
always @(posedge clk) begin
    if (!reset_n) begin
        xtemp <= 0;
        ytemp <= 0;
    end
end

always @(posedge clk) begin
    xtemp <= x;
    ytemp <= y;
end

//-----------------------------------------------------
// Instantiate 32-bit multipliers
//-----------------------------------------------------
vdcmul_32b v321 (
    xtemp[31:0],
    ytemp[31:0],
    pp1
);

vdcmul_32b v322 (
    xtemp[31:0],
    ytemp[63:32],
    pp2
);

vdcmul_32b v323 (
    xtemp[63:32],
    ytemp[31:0],
    pp3
);

vdcmul_32b v324 (
    xtemp[63:32],
    ytemp[63:32],
    pp4
);

//-----------------------------------------------------
// Register partial products
//-----------------------------------------------------
always @(posedge clk) begin
    temp1 <= pp1;
    temp2 <= pp2;
    temp3 <= pp3;
    temp4 <= pp4;
end

//-----------------------------------------------------
// First 64-bit RCA
//-----------------------------------------------------
rca64 r321 (
    temp2,
    temp3,
    1'b0,
    c1,
    sum1
);

always @(posedge clk) begin
    tempc1 <= c1;
    temps1 <= sum1;
end

//-----------------------------------------------------
// Second 64-bit RCA
//-----------------------------------------------------
rca64 r322 (
    sum1,
    {32'b0, temp1[63:32]},
    1'b0,
    c2,
    sum2
);

always @(posedge clk) begin
    tempc2 <= c2;
    temps2 <= sum2;
end

//-----------------------------------------------------
// Half-adder for carries
//-----------------------------------------------------
half_adder h1 (
    tempc1,
    tempc2,
    s1,
    ca1
);

always @(posedge clk) begin
    has  <= s1;
    haca <= ca1;
end

//-----------------------------------------------------
// Third 64-bit RCA
//-----------------------------------------------------
rca64 r323 (
    temp4,
    {30'b0, haca, has, temps2[63:32]},
    1'b0,
    c3,
    sum3
);

always @(posedge clk) begin
    temps3 <= sum3;
end

//-----------------------------------------------------
// Final product
//-----------------------------------------------------
assign prod = {temps3, temps2[31:0], temp1[31:0]};

endmodule
