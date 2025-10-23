// `include "../src/vdcmul_2b.v"
// `include "../src/rca_4b.v"
// `include "../src/vdcmul_2b"
module vdcmul_4b(
                   x,
                   y,
                   prod
                   );

input [3:0] x, y;


output [7:0] prod;
wire [3:0] pp1, pp2, pp3, pp4;
wire c1, c2, c3,s1,ca1;
wire [3:0] sum1, sum2 ,sum3;

vdcmul_2b v1(x[1:0], y[1:0], pp1);
vdcmul_2b v2(x[1:0], y[3:2], pp2);
vdcmul_2b v3(x[3:2], y[1:0], pp3);
vdcmul_2b v4(x[3:2], y[3:2], pp4);

rca_4b r1(pp2, pp3, 1'b0, c1, sum1);
rca_4b r2(sum1, {2'b00, pp1[3:2]}, 1'b0, c2, sum2);
half_adder h1(c1,c2,s1,ca1);
rca_4b r3(pp4, {ca1, s1, sum2[3:2]}, 1'b0, c3, sum3);

assign prod = {sum3, sum2[1:0],pp1[1:0]};

endmodule


/*
        x[3:2] x[1:0]
    ×   y[3:2] y[1:0]
----------------------
        pp1   (low × low)
+   (pp2, shifted)
+   (pp3, shifted)
+ (pp4, shifted twice)
----------------------
        product (8 bits)
*/

/* 
x = 1011₂ = 11₁₀
y = 0110₂ =  6₁₀
Expected result: 11 × 6 = 66 = 1000010

x[3:2] = 10₂ (2)   ,  x[1:0] = 11₂ (3)
y[3:2] = 01₂ (1)   ,  y[1:0] = 10₂ (2)

pp1 = x[1:0] * y[1:0] = 11₂ (3) × 10₂ (2) = 110₂ (6) → 4-bit: 0110
pp2 = x[1:0] * y[3:2] = 11₂ (3) × 01₂ (1) = 11₂ (3) → 4-bit: 0011
pp3 = x[3:2] * y[1:0] = 10₂ (2) × 10₂ (2) = 100₂ (4) → 4-bit: 0100
pp4 = x[3:2] * y[3:2] = 10₂ (2) × 01₂ (1) = 10₂ (2) → 4-bit: 0010

prod = { sum3, sum2[1:0], pp1[1:0] }
     = { 0100 , 01 , 10 }
     = 01000110₂



*/