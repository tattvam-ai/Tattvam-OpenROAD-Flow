module clk_divider#(
    parameter DIVISION_RATIO = 4,
    parameter COUNTER_WIDTH = $clog2(4)
)
(
    input logic reset,
    input logic clk,
    output logic out_clk
);

logic [COUNTER_WIDTH - 1:0] clk_count;
/*
 * Clock Divider Logic
 * Divices input clock by DIV_RATIO
 * Output duty cycle = 50% when DIV_RATIO is even
 * MSB of counter provides divided clock
 *
*/

always_ff @(posedge clk) begin
    if (reset) begin
        clk_count <= '0;
        out_clk   <= 1'b0;
    end else begin
        clk_count <= clk_count + 1'b1;
        out_clk   <= clk_count[COUNTER_WIDTH-1];  // MSB for division
    end
end
endmodule