module bram_1rw_64x64_wrapper#(
	parameter ADDR_WIDTH = 6,
	parameter DATA_WIDTH = 64,
	parameter MEMSIZE = 64)(

  input  wire        clka,    
  input  wire        rst_n,   
  input  wire [ADDR_WIDTH-1:0]  addra,   
  input  wire [DATA_WIDTH-1:0] dina,    
  input  wire        wea,     
  input  wire        ena,    
  output wire [DATA_WIDTH-1:0] douta    
);

  wire [DATA_WIDTH-1:0]          fakeram_rd_out;
  reg [DATA_WIDTH-1:0]          out_reg;

  fakeram7_64x64 mem (  
    .clk      (clka),
    .addr_in  (addra),
    .wd_in    (dina),
    .we_in    (wea),
    .ce_in    (ena),
    .rd_out   (fakeram_rd_out)
  );

 //Mimic one-cycle latency 
  always @(posedge clka) begin
    if (ena) begin
      out_reg <= fakeram_rd_out;
    end
  end

  assign douta = out_reg;

endmodule



module bram_1rw_64x32_wrapper#(
		parameter ADDR_WIDTH = 6,
		parameter DATA_WIDTH = 32,
		parameter MEMSIZE = 64)(
  input  wire        clka,    
  input  wire        rst_n,   
  input  wire [5:0]  addra,   
  input  wire [63:0] dina,    
  input  wire        wea,     
  input  wire        ena,    
  output wire [63:0] douta    
);
  (* RAM_STYLE = "BLOCK" *)
  wire [DATA_WIDTH-1:0]          fakeram_rd_out;
  reg [DATA_WIDTH-1:0]          out_reg;

  fakeram7_64x32 mem (  
    .clk      (clka),
    .addr_in  (addra),
    .wd_in    (dina),
    .we_in    (wea),
    .ce_in    (ena),
    .rd_out   (fakeram_rd_out)
  );

 //Mimic one-cycle latency 
  always @(posedge clka) begin
    if (ena) begin
      out_reg <= fakeram_rd_out;
    end
  end

  assign douta = out_reg;

endmodule




module bram_1rw_64x20_wrapper#(
		parameter ADDR_WIDTH = 6,
		parameter DATA_WIDTH = 20,
		parameter MEMSIZE = 64)(
  input  wire        clka,    
  input  wire        rst_n,   
  input  wire [5:0]  addra,   
  input  wire [63:0] dina,    
  input  wire        wea,     
  input  wire        ena,    
  output wire [63:0] douta    
);

  wire [DATA_WIDTH-1:0]          fakeram_rd_out;
  reg [DATA_WIDTH-1:0]          out_reg;
   
  fakeram7_64x20 mem (  
    .clk      (clka),
    .addr_in  (addra),
    .wd_in    (dina),
    .we_in    (wea),
    .ce_in    (ena),
    .rd_out   (fakeram_rd_out)
  );

 //Mimic one-cycle latency 
  always @(posedge clka) begin
    if (ena) begin
      out_reg <= fakeram_rd_out;
    end
  end

  assign douta = out_reg;

endmodule
