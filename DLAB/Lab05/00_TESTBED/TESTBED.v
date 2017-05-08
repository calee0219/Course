`timescale 1ns/10ps

`include "PATTERN.v"

`ifdef RTL
  `include "SORT.v"
`endif
`ifdef GATE
  `include "SORT_SYN.v"
`endif

module TESTBED();

wire [4:0] out;
wire out_valid;
wire [4:0] in;
wire mode;
wire [1:0] op;
wire in_valid1;
wire in_valid2;
wire clk;
wire rst_n;
 
PATTERN I_PATTERN(
	.out(out),  
	.out_valid(out_valid), 
	.in(in), 
	.rst_n(rst_n),
	.mode(mode),
	.op(op),	
	.in_valid1(in_valid1),
	.in_valid2(in_valid2),
	.clk(clk)	
);

SORT  I_SORT(
	.out(out),  
	.out_valid(out_valid), 
	.in(in), 
	.rst_n(rst_n),
	.mode(mode), 
	.op(op),
	.in_valid1(in_valid1),
	.in_valid2(in_valid2),
	.clk(clk)
);

initial begin

`ifdef RTL
	$fsdbDumpfile("SORT.fsdb");
	$fsdbDumpvars;
`endif
`ifdef GATE
	$sdf_annotate("SORT_SYN.sdf", I_SORT);
	$fsdbDumpfile("SORT_SYN.fsdb");
	$fsdbDumpvars;
`endif

end

endmodule
