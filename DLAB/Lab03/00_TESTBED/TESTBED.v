`timescale 1ns/10ps

`include "PATTERN.v"

`ifdef RTL
  `include "IMPOR.v"
`endif
`ifdef GATE
  `include "IMPOR_SYN.v"
`endif

module TESTBED();

wire [2:0] out;
wire out_valid;
wire ready;
wire [2:0] in;
wire [2:0] mode;
wire in_valid;
wire clk;
wire rst_n;
 
PATTERN I_PATTERN(
	.out(out),  
	.out_valid(out_valid), 
	.ready(ready),
	.in(in), 
	.mode(mode), 
	.in_valid(in_valid),
	.clk(clk),
	.rst_n(rst_n)
);

IMPOR I_IMPOR(
	.out(out),  
	.out_valid(out_valid), 
	.ready(ready),
	.in(in), 
	.mode(mode), 
	.in_valid(in_valid),
	.clk(clk),
	.rst_n(rst_n)
);

initial begin

`ifdef RTL
	$fsdbDumpfile("IMPOR.fsdb");
	$fsdbDumpvars;
`endif
`ifdef GATE
	$sdf_annotate("IMPOR_SYN.sdf", I_IMPOR);
	$fsdbDumpfile("IMPOR_SYN.fsdb");
	$fsdbDumpvars;
`endif

end

endmodule