parameter WORD_SIZE = 8;
parameter ROW_SIZE = 10;
parameter BUFFER_SIZE = 3;

/*
sliding[0][0] sliding[0][1] sliding[0][2]   ← row 0 (top)
sliding[1][0] sliding[1][1] sliding[1][2]   ← row 1 (middle)
sliding[2][0] sliding[2][1] sliding[2][2]   ← row 2 (bottom, newest row)
*/

module sobel #(parameter WORD_SIZE=8)
             (input logic clock,
              input logic reset,
              input logic [WORD_SIZE-1:0] inputPixel,
              output logic [WORD_SIZE-1:0] outputPixel);
				  
	localparam BUFFER_SIZE=3;

  logic [BUFFER_SIZE-1:0] [WORD_SIZE-1:0] sliding [BUFFER_SIZE-1:0];
  sliding_window #(WORD_SIZE,BUFFER_SIZE) my_window(.*);
    
  logic [WORD_SIZE+1:0] gx1, gx2, gy1, gy2;
	
   always_ff @(posedge clock)  
     if (reset) begin
        gx1 <= 0;
        gx2 <= 0;
        gy1 <= 0;
        gy2 <= 0;
     end
     else begin
      
      // Horizontal gradient (Gx)
      gx1 <= {2'b0, sliding[0][0]}           // top-left pixel, weight = 1 (part of left column, negative in Gx)
            + {2'b0, sliding[2][0]}         // bottom-left pixel, weight = 1 (part of left column, negative in Gx)
            + ({1'b0, sliding[1][0]} << 1); // middle-left pixel, weight = 2 (left column, negative in Gx, shifted left to multiply by 2)

      gx2 <= {2'b0, sliding[0][2]}           // top-right pixel, weight = 1 (right column, positive in Gx)
            + {2'b0, sliding[2][2]}         // bottom-right pixel, weight = 1 (right column, positive in Gx)
            + ({1'b0, sliding[1][2]} << 1); // middle-right pixel, weight = 2 (right column, positive in Gx)

      // Vertical gradient (Gy)
      gy1 <= {2'b0, sliding[0][0]}           // top-left pixel, weight = 1 (top row, negative in Gy)
            + {2'b0, sliding[0][2]}         // top-right pixel, weight = 1 (top row, negative in Gy)
            + ({1'b0, sliding[2][1]} << 1); // middle-bottom pixel, weight = 2 (bottom row, positive in Gy)

      gy2 <= {2'b0, sliding[2][0]}           // bottom-left pixel, weight = 1 (bottom row, positive in Gy)
            + {2'b0, sliding[2][2]}         // bottom-right pixel, weight = 1 (bottom row, positive in Gy)
            + ({1'b0, sliding[0][1]} << 1); // middle-top pixel, weight = 2 (top row, negative in Gy)

     end

	  
  logic [WORD_SIZE+1:0] gx, gy;
   always_comb begin
     if (gx1 > gx2) gx = gx1-gx2;
      else gx = gx2 - gx1;
     if (gy1 > gy2) gy = gy1-gy2;
      else gy = gy2-gy1;
   end
			
  //Each sum (gx1, gx2, gy1, gy2) can have 3 terms and max: 255 + 255 + 2 * 255 = 1020, so we need 10 bits
  logic [WORD_SIZE+2:0] g;
   
   //Approximate sqrt(gx^2 + gy^2)
   always_comb g = gy+gx; 
   always_ff @(posedge clock)  
     if (reset) 
        outputPixel = 0;
     else 
       if (g[WORD_SIZE+2]) begin
        outputPixel = {WORD_SIZE{1'b1}}; //overflow
       end 
	    else outputPixel = g[WORD_SIZE+1:2]; // implicitly shifting right by 2 (from 10 bits to 8 bits word size)
   
endmodule
