`timescale 1ns/100ps
`include "PATTERN.v"
//`ifdef RTL
`include "Online_test2.v"
//`elsif GATE
//`include "LPAG_SYN.v"
//`endif

module TESTBED();

wire              clk;
wire              rst_n;
wire             in_valid;
wire	[15:0]     in;
wire 	           in_mode;
wire          out_valid;
wire   [35:0] out;


initial begin
  $fsdbDumpfile( "Online_test2.fsdb" );
  $fsdbDumpvars;
  //$fsdbDumpvars(0,"+mda");
end

Online_test2 U_Online_test2(
 .clk(clk), 
	.rst_n(rst_n), 
	.in_valid(in_valid), 
	.in(in),
	.in_mode(in_mode),	
	.out_valid(out_valid), 
	.out(out));

PATTERN I_PATTERN(
.clk(clk), 
	.rst_n(rst_n), 
	.in_valid(in_valid), 
	.in(in),
	.in_mode(in_mode),	
	.out_valid(out_valid), 
	.out(out)
);







endmodule
