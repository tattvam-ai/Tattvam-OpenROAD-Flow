module moore_nonoverlap (
    input  logic clk,
    input  logic reset,   // Active high reset
    input  logic in_sig,      // Serial input bit
    output logic out      // Output (1 when 1101 detected)
);

    // Define states
    typedef enum logic [2:0] { S0, S1, S2, S3, S4 } state_t;
    state_t present_state, next_state;

    // State register
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            present_state <= S0;
        else
            present_state <= next_state;
    end

    // Next-state logic and output
    always_comb begin
        next_state = present_state;
        out = 1'b0;

        case (present_state)
            S0: begin
                if (in_sig) next_state = S1;
                else    next_state = S0;
            end
            S1: begin
                if (in_sig) next_state = S2;
                else    next_state = S0;
            end
            S2: begin
                if (in_sig) next_state = S2;
                else    next_state = S3;
            end
            S3: begin
                if (in_sig) next_state = S4;
                else    next_state = S0;
            end
            S4: begin
                if (in_sig) next_state = S1;
                else    next_state = S0;
                out = 1'b1; // Moore output active only in S4
            end
             default: begin
                 next_state = S0; // recover to a safe state
                 out = 0;
            end
        endcase
    end

endmodule

