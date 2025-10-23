module rca_1b(
                   a,
                   b,
                   cin,
                   cout,
                   sum
                   );

input a, b;
input cin;
output sum;
output cout;

assign sum = a ^ b ^ cin;
assign cout = a&b | b&cin | cin&a;
endmodule
