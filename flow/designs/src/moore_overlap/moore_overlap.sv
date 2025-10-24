module moore_overlap #(
    parameter S0 = 0, 
    parameter S1 = 1, 
    parameter S2 = 2, 
    parameter S3 = 3, 
    parameter S4 = 4
)
(
    input  logic in_sig,
    input  logic clk,
    input  logic reset,
    output logic out
);

logic [2:0] present_state, next_state;

/* Sequential state update */
always_ff @ (posedge clk or posedge reset) begin
    if (reset)
        present_state <= S0;
    else
        present_state <= next_state;
end

/* Next-state and output logic */
always_comb begin
    case(present_state)
        S0: begin
            if (in_sig) next_state = S1; 
            else next_state = S0;
            out = 0;
        end
        S1: begin
            if (in_sig) next_state = S2; 
            else next_state = S0;
            out = 0;
        end
        S2: begin
            if (in_sig) next_state = S2; 
            else next_state = S3;
            out = 0;
        end
        S3: begin
            if (in_sig) next_state = S4; 
            else next_state = S0;
            out = 0;
        end
        S4: begin
            if (in_sig) next_state = S2; 
            else next_state = S0;
            out = 1;
        end
        default: begin
            next_state = S0;
            out = 0;
        end
    endcase
end

endmodule
