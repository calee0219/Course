`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:31 12/12/2016 
// Design Name: 
// Module Name:    Lab08_0416037
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
module Lab08_0416037(
	input clk, 
	input rst,
	input sqt,
	input pls,
	input mut,
	input [3:0] SW,
	output reg [7:0] LED,
	output [11:8] SF_D,
	output LCD_E,
	output LCD_RS,
	output LCD_RW
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
wire [7:0] uNum;
reg [7:0] dNum;

wire [127:0] up, down;

//---------------------------------------------------------------------
//   COMBINATIONAL CIRCUIT                             
//---------------------------------------------------------------------

assign uNum = ans;

sqrt sqrt_module(
  .x_in(ans), // input [7 : 0] x_in
  .x_out(sqrtAns), // output [4 : 0] x_out
  .clk(clk) // input clk
);

LCD lcd_module(
    .clk(clk),
    .rst(rst),
    //.upRow("1ab"),
    .upRow(up),
    .doRow(down),
    .e(LCD_E),
    .rs(LCD_RS),
    .rw(LCD_RW),
    .sf(SF_D)
);

n2s n2s_up(
    .clk(clk),
    .rst(rst),
    .num(uNum),
    .deal(1),
    .str(up)
);

n2s n2s_down(
    .clk(clk),
    .rst(rst),
    .num(dNum),
    .deal(0),
    .str(down)
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
			if(sqt || mut || pls) nState = OPT;
			else nState = IDLE;
		end
		NUM: begin
			if((haha > HAHA_STOP) && (sqt || mut || pls)) nState = OPT;
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
				else if(!(sqt || mut || pls)) haha <= haha+1;
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
			if(sqt || mut || pls) cnt <= cnt+1;
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
			if(sqt) opt <= SQRT;
			else if(pls) opt <= ADD;
			else if(mut) opt <= MULT;
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

// dNum
always@(posedge clk, posedge rst)
begin
	if(rst) dNum <= 0;
	else begin
	case(cState)
		IDLE: dNum <= SW;
		OPT: dNum <= dNum;
		NUM: begin
			case(opt)
				RESET: dNum <= SW;
				ADD: dNum <= ans + SW;
				MULT: dNum <= ans * SW;
				SQRT: dNum <= sqrtAns;
				default: dNum <= dNum;
			endcase
		end
		default: dNum <= dNum;
	endcase
	end
end

endmodule
