`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        NCTU DLAB
// Engineer:       Gavin Lee
// 
// Create Date:    21:56:27 11/27/2016 
// Design Name: 
// Module Name:    lab07_0416037 
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
module lab07_0416037(
	 input rst,
	 input clk,
    input BTN_WEST,
    input BTN_NORTH,
    input BTN_EAST,
    input [3:0] SW,
    output reg [7:0] LED
    );

//---------------------------------------------------------------------
// PARAMETER DECLARATION
//---------------------------------------------------------------------

integer WAIT_TIME=2000000;
integer HAHA_STOP=1000;

parameter IDLE=0;
parameter OPT=1;
parameter NUM=2;

parameter RESET=0;
parameter ADD=1;
parameter SQRT=2;
parameter MULT=3;

//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION                             
//---------------------------------------------------------------------

reg [1:0] cState, nState;
reg [20:0] cnt;
reg [10:0] haha;
reg [7:0] ans;
reg [1:0] opt;
wire [4:0] sqrtAns;
reg can;

//---------------------------------------------------------------------
//   COMBINATIONAL CIRCUIT                             
//---------------------------------------------------------------------

sqrt sqrt_module(
  .x_in(ans), // input [7 : 0] x_in
  .x_out(sqrtAns), // output [4 : 0] x_out
  .clk(clk) // input clk
);

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
		IDLE: begin
			if(BTN_WEST || BTN_NORTH || BTN_EAST) nState = OPT;
			else nState = IDLE;
		end
		NUM: begin
			if((haha > HAHA_STOP) && (BTN_WEST || BTN_NORTH || BTN_EAST)) nState = OPT;
			else nState = NUM;
		end
		OPT: begin
			if(cnt >= WAIT_TIME) nState = NUM;
			else nState = OPT;
		end
		default: nState = IDLE;
	endcase
end

//---------------------------------------------------------------------
//   Design Description                                          
//---------------------------------------------------------------------

// haha
always@(posedge clk, posedge rst)
begin
	if(rst) haha <= 0;
	else begin
		case(cState)
			IDLE: haha <= 0;
			NUM: begin
				if(haha > HAHA_STOP) haha <= haha;
				else if(!(BTN_WEST || BTN_NORTH || BTN_EAST)) haha <= haha+1;
				else haha <= 0;
			end
			OPT: haha <= 0;
		endcase
	end
end

// can
always@(posedge clk, posedge rst)
begin
	if(rst) can <= 0;
	else if(cState == OPT && !can) can <= 1;
	else if(cState == OPT) can <= can;
	else can <= 0;
end

// cnt
always@(posedge clk, posedge rst)
begin
	if(rst) cnt <= 0;
	else begin
	case(cState)
		IDLE: cnt <= 0;
		NUM: cnt <= 0;
		OPT: begin
			if(BTN_WEST || BTN_NORTH || BTN_EAST) cnt <= cnt+1;
			else cnt <= cnt;
		end
	endcase
	end
end

// opt
always@(posedge clk, posedge rst)
begin
	if(rst) opt <= RESET;
	else begin
	case(cState)
		IDLE: opt <= RESET;
		OPT: begin
			if(BTN_WEST) opt <= SQRT;
			else if(BTN_EAST) opt <= ADD;
			else if(BTN_NORTH) opt <= MULT;
			else opt <= RESET;
		end
		NUM: opt <= opt;
		default opt <= opt;
	endcase
	end
end

// ans
always@(posedge clk, posedge rst)
begin
	if(rst) ans <= 0;
	else begin
	case(cState)
		IDLE: ans <= 0;
		OPT: begin
			if(!can) begin
				case(opt)
					RESET: ans <= SW;
					ADD: ans <= ans+SW;
					MULT: ans <= ans * SW;
					SQRT: ans <= sqrtAns;
					default: ans <= ans;
				endcase
			end
			else ans <= ans;
		end
		NUM: ans <= ans;
		default: ans <= ans;
	endcase
	end
end

// LED

always@(posedge clk, posedge rst)
begin
	if(rst) LED <= 0;
	else begin
	case(cState)
		IDLE: LED <= SW;
		OPT: LED <= LED;
		NUM: begin
			case(opt)
				RESET: LED <= SW;
				ADD: LED <= ans + SW;
				MULT: LED <= ans * SW;
				SQRT: LED <= sqrtAns;
				default: LED <= LED;
			endcase
		end
		default: LED <= LED;
	endcase
	end
end
/*
always@(posedge clk, posedge rst)
begin
	if(rst) LED <= 0;
	else begin
		LED <= cState;
	end
end
*/

endmodule