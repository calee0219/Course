`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:57:24 11/17/2016 
// Design Name: 
// Module Name:    DLAU 
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
module DALU(
    // Input signals
	clk,
	rst,
	in_valid,
	instruction,
  // Output signals
  out_valid,
  out
    );

//---------------------------------------------------------------------
//   INPUT AND OUTPUT DECLARATION                         
//---------------------------------------------------------------------

input clk;
input rst;
input in_valid;
input [18:0] instruction;

output reg out_valid;
output reg signed [15:0] out;

//---------------------------------------------------------------------
// PARAMETER DECLARATION
//---------------------------------------------------------------------

parameter IDLE=0, INPUT=1, OUTPUT=2, OP=3;

//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION                             
//---------------------------------------------------------------------

reg [1:0] cState, nState;
wire [2:0] L;
wire signed [5:0] s, t;
wire signed [3:0] l;
wire signed [9:0] i;

//---------------------------------------------------------------------
//   Combinational Circuits
//---------------------------------------------------------------------

assign L = instruction[18:16];
assign s = instruction[15:10];
assign t = instruction[9:4];
assign l = instruction[3:0];
assign i = instruction[9:0];

//---------------------------------------------------------------------
//   Finite-State Mechine                                          
//---------------------------------------------------------------------

// cState
always@(posedge clk, posedge rst)
begin
	if(rst) cState <= IDLE;
	else cState <= nState;
end

// nState
always@(*)
begin
	case(cState)
		IDLE: if(in_valid) nState = INPUT;
		INPUT: if(!in_valid) nState = OUTPUT;
		OUTPUT: nState = IDLE;
		default: nState = IDLE;
	endcase
end

//---------------------------------------------------------------------
//   Design Description                                          
//---------------------------------------------------------------------

// out_valid
always@(posedge clk, posedge rst)
begin
	if(rst) out_valid <= 0;
	else begin
		case(cState)
			IDLE: out_valid <= 0;
			INPUT: out_valid <= 0;
			OUTPUT: out_valid <= 1;
			default: out_valid <= out_valid;
		endcase
	end
end

// out
always@(posedge clk, posedge rst)
begin
	if(rst) out <= 0;
	else begin
		case(cState)
			IDLE: begin
				if(nState == INPUT) begin
					case(L)
						0: begin
							case(l)
								0: out <= s & t;
								1: out <= s | t;
								2: out <= s ^ t;
								3: out <= s + t;
								4: out <= s - t;
								default: out <= out;
							endcase
						end
						1: out <= s * t * l;
						2: out <= (s+t+l) * (s+t+l);
						3: out <= s + i;
						4: out <= s - i;
						default: out <= out;
					endcase
				end
			end
			INPUT: out <= out;
			OUTPUT: out <= out;
			default: out <= out;
		endcase
	end
end

endmodule
