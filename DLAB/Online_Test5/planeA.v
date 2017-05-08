`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:10:59 01/08/2017 
// Design Name: 
// Module Name:    planeA 
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
module planeA(
	input clk,
	input rst,
	input [10:0] x,
	input [10:0] y,
	input [10:0] poX,
	input [10:0] poY,
	output reg wing,
	output reg body
    );
	
parameter pL = 40;
parameter pW = 10;
parameter wL = 15;
parameter wW = 15;
parameter wP = 15;

// body
always@(posedge clk, posedge rst)
begin
	if(rst) body <= 0;
	else begin
		if(x < poX+pL && x > poX && y < poY+wL+pW && y >poY+wL) body <= 1;
		else body <= 0;
	end
end

// wing
always@(posedge clk, posedge rst)
begin
	if(rst) wing <= 0;
	else begin
		if(x < poX+wP+wW && x > poX+wP && y < poY+wL && y > poY && x-y-poX+poY < wP) wing <= 1;
		else if(x < poX+wP+wW && x > poX+wP && y > poY+wL+pW && y < poY+wL+wL+pW && x-poX+y-poY < wP+pL) wing <= 1;
		else wing <= 0;
	end
end
endmodule
