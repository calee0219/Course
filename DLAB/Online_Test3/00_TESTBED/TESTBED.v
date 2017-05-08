//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   ICLAB 2016 Fall
//   Lab01-Practice		: Polynomial Integrator
//   Author     		: Chien-Tung, Shih (ct.shihg@gmail.com)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : TESETBED.v
//   Module Name : TESETBED
//   Release version : V1.0 (Release Date: 2016-09)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

`timescale 1ns/10ps
`include "PATTERN.v"
`ifdef RTL
  `include "OT11_27.v"
`endif
`ifdef GATE
  `include "OT11_27_SYN.v"
`endif
	  		  	
module TESTBED;

wire	 clk,rst_n,in_valid1,in_valid2;
wire  [7:0]in,bomb;
wire  [5:0]hit;
wire 							out_valid;
wire		[6:0]	out;

initial begin
  `ifdef RTL
    $fsdbDumpfile("OT11_27.fsdb");
    $fsdbDumpvars();
  `endif
  `ifdef GATE
    $sdf_annotate("OT11_27_SYN.sdf",U_OT11_27);
    $fsdbDumpfile("OT11_27_SYN.fsdb");
    $fsdbDumpvars();    
  `endif
end

  OT11_27     U_OT11_27   (
	clk,
	rst_n,
	in,
	bomb,
	in_valid1,
	hit,
	in_valid2,
  // Input signals
 
  out_valid,
  out
  );
	
  PATTERN I_PATTERN(
	clk,
	rst_n,
	in,
	bomb,
	in_valid1,
	hit,
	in_valid2,
  // Input signals
 
  out_valid,
  out
  );
  
 
endmodule
