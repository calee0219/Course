`timescale 1ns/10ps

`include "PATTERN.v"

`ifdef RTL
  `include "Online_test1.v"
`endif
`ifdef GATE
  `include "Online_test1_SYN.v"
`endif

module TESTBED();

wire [10:0] out;
wire out_valid;
wire [3:0] in;
wire [1:0] mode;
wire in_valid;
wire clk;
wire rst_n;
 
PATTERN I_PATTERN(
	.out(out),  
	.out_valid(out_valid), 
	.in(in), 
	.rst_n(rst_n),
	.mode(mode), 
	.in_valid(in_valid),
	.clk(clk)	
);

Online_test1 I_TEST(
	.out(out),  
	.out_valid(out_valid), 
	.in(in), 
	.rst_n(rst_n),
	.mode(mode), 
	.in_valid(in_valid),
	.clk(clk)
);

initial begin

`ifdef RTL
	$fsdbDumpfile("Online_test1.fsdb");
	$fsdbDumpvars;
`endif
`ifdef GATE
	$sdf_annotate("Online_test1_SYN.sdf", I_TEST);
	$fsdbDumpfile("Online_test1_SYN.fsdb");
	$fsdbDumpvars;
`endif

end

endmodule
