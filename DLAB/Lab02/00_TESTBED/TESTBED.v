//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright 
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   2015 DLAB Course
//   Lab02      :   Matrix
//   Author     :   Hsiao-Kai, Liao
//   File name  :   TESTBED.v
//###########################################################################

`timescale 1ns/10ps
`include "PATTERN.v"
`include "CONVCOR.v"

module TESTBED();

wire             clk;
wire             rst_n;
wire             in_valid;
wire 	[15:0]   in_a;
wire 	[15:0]   in_b;
wire 	         in_mode;
wire             out_valid;
wire    [35:0]   out;


PATTERN I_PATTERN(	
	.clk      (clk      ), 
	.rst_n    (rst_n    ), 
	.in_valid (in_valid ), 
	.in_a     (in_a     ),
	.in_b     (in_b     ),
	.in_mode  (in_mode  ), 	
	.out_valid(out_valid), 
	.out      (out      )
);
				
CONVCOR  U_DESIGN(	
	.clk      (clk      ), 
	.rst_n    (rst_n    ), 
	.in_valid (in_valid ), 
	.in_a     (in_a     ),
	.in_b     (in_b     ),
	.in_mode  (in_mode  ), 	
	.out_valid(out_valid), 
	.out      (out      )
);

					  
initial begin
$fsdbDumpfile("CONVCOR.fsdb");
$fsdbDumpvars;
end

endmodule
