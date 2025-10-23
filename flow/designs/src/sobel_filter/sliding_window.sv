
module sliding_window #(parameter WORD_SIZE=8, 
                        parameter BUFFER_SIZE=3,
                        parameter ROW_SIZE=10)
               (input logic clock, 
                input logic reset,
                input logic [WORD_SIZE-1:0] inputPixel,
                output logic [BUFFER_SIZE-1:0][WORD_SIZE-1:0]sliding[BUFFER_SIZE-1:0]
                );
  // can store 2 pixels = 16 bits per location pointed by the pointer
  logic [(BUFFER_SIZE-1)*WORD_SIZE-1:0] buffer[ROW_SIZE-1:0];
  logic [$clog2(ROW_SIZE)-1:0] ptr;// [3:0] ptr
  

/*
sliding[0][0] sliding[0][1] sliding[0][2]   ← row 0 (top)
sliding[1][0] sliding[1][1] sliding[1][2]   ← row 1 (middle)
sliding[2][0] sliding[2][1] sliding[2][2]   ← row 2 (bottom, newest row)

buffer[0] : [ pixel0  | pixel1 ]
buffer[1] : [ pixel2  | pixel3 ]
buffer[2] : [ pixel4  | pixel5 ]
...
buffer[9] : [ pixel18 | pixel19 ]


*/


  always_ff @(posedge clock)
    if(reset) begin
      ptr <=0;
      sliding[0][0] <= 0;
      sliding[0][1] <= 0;
      sliding[0][2] <= 0;
      sliding[1][0] <= 0;
      sliding[1][1] <= 0;
      sliding[1][2] <= 0;
      sliding[2][0] <= 0;
      sliding[2][1] <= 0;
      sliding[2][2] <= 0;
    end
    else begin
      sliding[0][0] <= inputPixel;
      sliding[1][0] <= sliding[0][0];
      sliding[1][1] <= sliding[0][1];
      sliding[1][2] <= sliding[0][2];
      sliding[2][0] <= sliding[1][0];
      sliding[2][1] <= sliding[1][1];
      sliding[2][2] <= sliding[1][2];
      
      // Storing values on the last row except the last column
      buffer[ptr] <= sliding[BUFFER_SIZE-1][BUFFER_SIZE-2:0];
      // sliding [0][0] gets the new pixel, the rest gets values from the buffer
      sliding[0][BUFFER_SIZE-1:1] <= buffer[ptr];
      if(ptr < ROW_SIZE-BUFFER_SIZE) ptr <= ptr + 1;
	  else ptr <= 0;
    end
endmodule: sliding_window

