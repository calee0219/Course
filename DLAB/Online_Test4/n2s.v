`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:06:31 12/18/2016 
// Design Name: 
// Module Name:    n2s 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module n2s(
    input clk,
    input [20:0] num,
    input [20:0] org,
    input [1:0] cState,
    output [127:0] uRow,
    output [127:0] dRow
    );

wire [20:0] min, sec;
wire [20:0] m1, m0, s1, s0;
wire rfd1, rfd2, rfd3;

wire [20:0] min2, sec2;
wire [20:0] m12, m02, s12, s02;
wire rfd12, rfd22, rfd32;

assign uRow[87:0] = (cState==3)? " Time's up!":"           ";
div divNum (
	.clk(clk), // input clk
	.rfd(rfd1), // output rfd
	.dividend(num), // input [20 : 0] dividend
	.divisor(60), // input [20 : 0] divisor
	.quotient(min), // output [20 : 0] quotient
	.fractional(sec) // output [20 : 0] fractional
);
div divMin (
	.clk(clk), // input clk
	.rfd(rfd2), // output rfd
	.dividend(min), // input [20 : 0] dividend
	.divisor(10), // input [20 : 0] divisor
	.quotient(m1), // output [20 : 0] quotient
	.fractional(m0) // output [20 : 0] fractional
);
div divSec (
	.clk(clk), // input clk
	.rfd(rfd3), // output rfd
	.dividend(sec), // input [20 : 0] dividend
	.divisor(10), // input [20 : 0] divisor
	.quotient(s1), // output [20 : 0] quotient
	.fractional(s0) // output [20 : 0] fractional
);
div divNum2 (
	.clk(clk), // input clk
	.rfd(rfd12), // output rfd
	.dividend(org), // input [20 : 0] dividend
	.divisor(60), // input [20 : 0] divisor
	.quotient(min2), // output [20 : 0] quotient
	.fractional(sec2) // output [20 : 0] fractional
);
div divMin2 (
	.clk(clk), // input clk
	.rfd(rfd22), // output rfd
	.dividend(min2), // input [20 : 0] dividend
	.divisor(10), // input [20 : 0] divisor
	.quotient(m12), // output [20 : 0] quotient
	.fractional(m02) // output [20 : 0] fractional
);
div divSec2 (
	.clk(clk), // input clk
	.rfd(rfd32), // output rfd
	.dividend(sec2), // input [20 : 0] dividend
	.divisor(10), // input [20 : 0] divisor
	.quotient(s12), // output [20 : 0] quotient
	.fractional(s02) // output [20 : 0] fractional
);
assign uRow[127:120]=48+m1;
assign uRow[119:112]=48+m0;
assign uRow[111:104]=":";
assign uRow[103:96]=48+s1;
assign uRow[95:88]=48+s0;
//assign uRow[127:88] = {8'd48+m1,8'd48+m0,":",8'd48+s1,8'd48+s0};
//assign dRow =(cState==0)?"                ": {"Time ",8'd48+m12,8'd48+m02,":",8'd48+s12,8'd48+s02,"      "};
assign dRow[47:0]="      ";
assign dRow[127:88]=(cState==0)?"     ":"Time ";
assign dRow[87:80]=(cState==0)?" ":48+m12;
assign dRow[79:72]=(cState==0)?" ":48+m02;
assign dRow[71:64]=(cState==0)?" ":":";
assign dRow[63:56]=(cState==0)?" ":48+s12;
assign dRow[55:48]=(cState==0)?" ":48+s02;
endmodule
