`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:32:38 01/08/2017 
// Design Name: 
// Module Name:    plane 
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
module planeB(
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
parameter wP = 10;

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
		if(x < poX+wP+wW && x > poX+wP && y < poY+wL && y > poY && x-poX+y-poY >wW+wP) wing <= 1;
		else if(x < poX+wP+wW && x > poX+wP && y > poY+wL+pW && y < poY+wL+wL+pW && x-poX-y+poY >wP-wL-pW) wing <= 1;
		else wing <= 0;
	end
end



endmodule
