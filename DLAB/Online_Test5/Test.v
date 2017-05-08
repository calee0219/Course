`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:07:41 01/08/2017 
// Design Name: 
// Module Name:    Test 
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
module Test(
	input clk,
	input rst,
	input PS2_CLK,
	input PS2_DATA,
	output red,
	output green,
	output blue,
	output vsync,
	output hsync
    );
	
reg [24:0] counter;
reg timer;
reg w,s,d,up,down,left;
reg cState, nState;
reg [3:0] kCounter;
reg [21:0] kReg;
reg [7:0] kData;
wire check;
reg [10:0] x, y;
wire vis;
wire planeAb, planeBb;
wire planeAw, planeBw;
reg [10:0] planeAy, planeBy;
wire [10:0] planeAx, planeBx;
wire bA1,bA2,bA3,bA4,bA5,bA6,bA7,bA8,bA9,bA10;
wire bA11,bA12,bA13,bA14,bA15,bA16,bA17,bA18,bA19,bA20;
reg bA1_t,bA2_t,bA3_t,bA4_t,bA5_t,bA6_t,bA7_t,bA8_t,bA9_t,bA10_t;
reg bA11_t,bA12_t,bA13_t,bA14_t,bA15_t,bA16_t,bA17_t,bA18_t,bA19_t,bA20_t;
wire bB1,bB2,bB3,bB4,bB5,bB6,bB7,bB8,bB9,bB10;
wire bB11,bB12,bB13,bB14,bB15,bB16,bB17,bB18,bB19,bB20;
reg bB1_t,bB2_t,bB3_t,bB4_t,bB5_t,bB6_t,bB7_t,bB8_t,bB9_t,bB10_t;
reg bB11_t,bB12_t,bB13_t,bB14_t,bB15_t,bB16_t,bB17_t,bB18_t,bB19_t,bB20_t;
reg [5:0] bA_counter,bB_counter;
reg a, b, equ;
reg [5:0] e_counter;
reg over;
reg a_lost,b_lost,equal;
wire bAA,bBB;
wire rfdA,rfdB;
wire [3:0] aa_10,aa_1,bb_10,bb_1;
wire AA_1, AA_10, BB_1, BB_10;
always@(posedge clk or posedge rst)
begin
	if(rst)over<=0;
	else if(a_lost || b_lost || equal) over<=1;
	else over<=over;
end
always@(posedge clk or posedge rst)
begin
	if(rst)a_lost<=0;
	else if (!over && (planeAw || planeAb) &&(bBB)) a_lost<=1;
	else a_lost<=a_lost;   
end
always@(posedge clk or posedge rst)
begin
	if(rst)b_lost<=0;
	else if (!over && (planeBw || planeBb) &&(bAA) ) b_lost<=1;
	else b_lost<=b_lost;   
end
always@(posedge clk or posedge rst)
begin
	if(rst)begin e_counter<=0; equal<=0;end
	else if(e_counter==52 && !over) equal<=1;
	else if(bA_counter ==0 && bB_counter==0 && timer && !over) e_counter<=e_counter+1;
	else begin e_counter<=e_counter; equal<=equal; end
end
div divA (
	.clk(clk), // input clk
	.rfd(rfdA), // output rfd
	.dividend(bA_counter), // input [4 : 0] dividend
	.divisor(10), // input [4 : 0] divisor
	.quotient(aa_10), // output [4 : 0] quotient
	.fractional(aa_1)); // output [4 : 0] fractional
div divB (
	.clk(clk), // input clk
	.rfd(rfdB), // output rfd
	.dividend(bB_counter), // input [4 : 0] dividend
	.divisor(10), // input [4 : 0] divisor
	.quotient(bb_10), // output [4 : 0] quotient
	.fractional(bb_1)); // output [4 : 0] fractional
planeA pA(
	.clk(clk),
	.rst(rst),
	.poX(planeAx),
	.poY(planeAy),
	.x(x),
	.y(y),
	.wing(planeAw),
	.body(planeAb)
);
planeB pB(
	.clk(clk),
	.rst(rst),
	.poX(planeBx),
	.poY(planeBy),
	.x(x),
	.y(y),
	.wing(planeBw),
	.body(planeBb)
);
number an_10(
	.clk(clk),
	.rst(rst),
	.num(aa_10),
	.x(x),
	.y(y),
	.poX(300),
	.poY(50),
	.pic(AA_10)
);
number an_1(
	.clk(clk),
	.rst(rst),
	.num(aa_1),
	.x(x),
	.y(y),
	.poX(310),
	.poY(50),
	.pic(AA_1)
);
number bn_10(
	.clk(clk),
	.rst(rst),
	.num(bb_10),
	.x(x),
	.y(y),
	.poX(400),
	.poY(50),
	.pic(BB_10)
);
number bn_1(
	.clk(clk),
	.rst(rst),
	.num(bb_1),
	.x(x),
	.y(y),
	.poX(410),
	.poY(50),
	.pic(BB_1)
);

// vis
assign vis = (x<=904) && (x>=104) && (y>=24) && (y<=624);
assign hsync = ~((x>=919) && (x<1039));
assign vsync = ~((y>=659) && (y<665));

assign bAA=bA20 ||bA19 ||bA18 ||bA17 || bA16 ||
	   bA15 ||bA14 ||bA13 ||bA12 || bA11 ||
	   bA10 || bA9 || bA8 || bA7 || bA6 ||
	   bA5  || bA4 || bA3 || bA2 || bA1;
assign bBB=bB20 ||bB19 ||bB18 ||bB17 || bB16 ||
	   bB15 ||bB14 ||bB13 ||bB12 || bB11 ||
	   bB10 || bB9 || bB8 || bB7 || bB6 ||
	   bB5  || bB4 || bB3 || bB2 || bB1;
assign red = equal? (a|equ|b): (a_lost?(a):(b_lost? b : (planeBw || planeAw)));
assign green = equal? (a|equ|b): (a_lost?(a):(b_lost? b : (vis && 
	 ~(planeBw || planeBb || planeAw || planeAb ||
	    bAA||bBB||AA_1||AA_10||BB_1||BB_10
	   ))));
assign blue = equal? (a|equ|b): (a_lost?(a):(b_lost? b : (planeBb || planeAb ||
	   bAA||bBB)));

parameter PERIOD = 25000000;
// counter
always@(posedge clk, posedge rst)
begin
	if(rst) counter <= 0;
	else begin
		if(counter == PERIOD) counter <= 0;
		else counter <= counter + 1;
	end
end
// timer
always@(posedge clk, posedge rst)
begin
	if(rst) timer <= 0;
	else if(timer) timer <= 0;
	else if(counter == PERIOD) timer <= 1;
	else timer <= 0;
end

// plane
assign planeAx = 404;
assign planeBx = 604;

//x
always@(posedge clk ,posedge rst)
begin
	if(rst)x<=0;
	else begin
		if(x==1039)x<=0;
		else x<=x+1;
	end
end


//y
always@(posedge clk ,posedge rst)
begin
	if(rst)y<=0;
	else begin
		if(y==665) y<=0;
		else if(x==1039)y<=y+1;
		else y<=y;
	end
end


// check
assign check = kReg[1]^kReg[2]^kReg[3]^kReg[4]^kReg[5]^kReg[6]^kReg[7]^kReg[8]^kReg[9];

always@(posedge clk)
begin
	cState <= nState;
	nState <= PS2_CLK;
end

// kCounter
always@(posedge clk, posedge rst)
begin
	if(rst) kCounter <= 0;
	else begin
		if({cState,nState} == 2'b10) begin
			if(kCounter == 10) kCounter <= 0;
			else kCounter <= kCounter + 1;
		end 
		else kCounter <= kCounter;
	end
end
// kReg
always@(posedge clk, posedge rst)
begin
	if(rst) kReg <= 0;
	else begin
		case({cState,nState})
		2'b10:kReg<={PS2_DATA,kReg[21:1]};
		default:kReg<=kReg;
		endcase
	end
end

// kData
always@(posedge clk, posedge rst)
begin
	if(rst) kData <= 0;
	else begin
		if(kCounter == 0 && check == 1) begin
			if(kReg[11:1] == 11'hXX) kData<=0;
			else kData<=kReg[19:12];
		end		
		else kData<=kData;
	end
end
reg sig_f0;
always@(posedge clk, posedge rst)
begin
	if(rst)begin
		sig_f0<=0;
		w<=0;s<=0;d<=0;
		left<=0;up<=0;down<=0;
	end
	else begin
		if(kData==8'hf0) sig_f0<=1;
		else begin
			if(sig_f0) begin
				case(kData)
				8'h1d:w<=1;
				8'h1b:s<=1;
				8'h23:d<=1;
				8'h75:up<=1;
				8'h6b:left<=1;
				8'h72:down<=1;
				endcase
				sig_f0<=0;
				end 
			else begin
				sig_f0<=0;
				w<=0;s<=0;d<=0;
				left<=0;up<=0;down<=0;
				end
			end
	end
end
// planeAy
always@(posedge clk, posedge rst)
begin
	if(rst) planeAy <= 300;
	else begin
		if(w) planeAy<=(planeAy-20>24)?planeAy-20:planeAy;
		else if(s)planeAy<=(planeAy+40+20<624)?planeAy+20:planeAy;
		else planeAy <= planeAy;
	end
end
// planeBy
always@(posedge clk, posedge rst)
begin
	if(rst) planeBy <= 300;
	else begin
		if(up) planeBy<=(planeBy-20>24)?planeBy-20:planeBy;
		else if(down)planeBy<=(planeBy+40+20<624)?planeBy+20:planeBy;
		else planeBy <= planeBy;
	end
end
//bACounter
always@(posedge clk, posedge rst)
begin
	if(rst)bA_counter<=20;
	else if(d && bA_counter)bA_counter<=bA_counter-1;
	else bA_counter<=bA_counter;
end
//bBCounter
always@(posedge clk, posedge rst)
begin
	if(rst)bB_counter<=20;
	else if(left && bB_counter)bB_counter<=bB_counter-1;
	else bB_counter<=bB_counter;
end
//trigger
always@(posedge clk, posedge rst)
begin
	if(rst) begin
		bA1_t<=0;bA2_t<=0;bA3_t<=0;bA4_t<=0;bA5_t<=0;bA6_t<=0;
		bA7_t<=0;bA8_t<=0;bA9_t<=0;bA10_t<=0;bA11_t<=11;bA12_t<=0;
		bA13_t<=0;bA14_t<=0;bA15_t<=0;bA16_t<=0;bA17_t<=0;bA18_t<=0;
		bA19_t<=0;bA20_t<=0;
	end
	else begin
		if(d)begin
			case(bA_counter)
			20:bA20_t<=1;
			19:bA19_t<=1;
			18:bA18_t<=1;
			17:bA17_t<=1;
			16:bA16_t<=1;
			15:bA15_t<=1;
			14:bA14_t<=1;
			13:bA13_t<=1;
			12:bA12_t<=1;
			11:bA11_t<=1;
			10:bA10_t<=1;
			9:bA9_t<=1;
			8:bA8_t<=1;
			7:bA7_t<=1;
			6:bA6_t<=1;
			5:bA5_t<=1;
			4:bA4_t<=1;
			3:bA3_t<=1;
			2:bA2_t<=1;
			1:bA1_t<=1;
			default:begin
			bA1_t<=0;bA2_t<=0;bA3_t<=0;bA4_t<=0;bA5_t<=0;bA6_t<=0;
			bA7_t<=0;bA8_t<=0;bA9_t<=0;bA10_t<=0;bA11_t<=11;bA12_t<=0;
			bA13_t<=0;bA14_t<=0;bA15_t<=0;bA16_t<=0;bA17_t<=0;bA18_t<=0;
			bA19_t<=0;bA20_t<=0;
			end
			endcase
		end
		else begin
			bA1_t<=0;bA2_t<=0;bA3_t<=0;bA4_t<=0;bA5_t<=0;bA6_t<=0;
			bA7_t<=0;bA8_t<=0;bA9_t<=0;bA10_t<=0;bA11_t<=11;bA12_t<=0;
			bA13_t<=0;bA14_t<=0;bA15_t<=0;bA16_t<=0;bA17_t<=0;bA18_t<=0;
			bA19_t<=0;bA20_t<=0;
		end
	end
end
//trigger
always@(posedge clk, posedge rst)
begin
	if(rst) begin
		bB1_t<=0;bB2_t<=0;bB3_t<=0;bB4_t<=0;bB5_t<=0;bB6_t<=0;
		bB7_t<=0;bB8_t<=0;bB9_t<=0;bB10_t<=0;bB11_t<=11;bB12_t<=0;
		bB13_t<=0;bB14_t<=0;bB15_t<=0;bB16_t<=0;bB17_t<=0;bB18_t<=0;
		bB19_t<=0;bB20_t<=0;
	end
	else begin
		if(left)begin
			case(bB_counter)
			20:bB20_t<=1;
			19:bB19_t<=1;
			18:bB18_t<=1;
			17:bB17_t<=1;
			16:bB16_t<=1;
			15:bB15_t<=1;
			14:bB14_t<=1;
			13:bB13_t<=1;
			12:bB12_t<=1;
			11:bB11_t<=1;
			10:bB10_t<=1;
			9:bB9_t<=1;
			8:bB8_t<=1;
			7:bB7_t<=1;
			6:bB6_t<=1;
			5:bB5_t<=1;
			4:bB4_t<=1;
			3:bB3_t<=1;
			2:bB2_t<=1;
			1:bB1_t<=1;
			default:begin
			bB1_t<=0;bB2_t<=0;bB3_t<=0;bB4_t<=0;bB5_t<=0;bB6_t<=0;
			bB7_t<=0;bB8_t<=0;bB9_t<=0;bB10_t<=0;bB11_t<=11;bB12_t<=0;
			bB13_t<=0;bB14_t<=0;bB15_t<=0;bB16_t<=0;bB17_t<=0;bB18_t<=0;
			bB19_t<=0;bB20_t<=0;
			end
			endcase
		end
		else begin
			bB1_t<=0;bB2_t<=0;bB3_t<=0;bB4_t<=0;bB5_t<=0;bB6_t<=0;
			bB7_t<=0;bB8_t<=0;bB9_t<=0;bB10_t<=0;bB11_t<=11;bB12_t<=0;
			bB13_t<=0;bB14_t<=0;bB15_t<=0;bB16_t<=0;bB17_t<=0;bB18_t<=0;
			bB19_t<=0;bB20_t<=0;
		end
	end
end
bullet bA1_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeAx),.poY(planeAy),
	.trigger(bA1_t),.timer(timer),.d(1),.bullet(bA1)
);
bullet bA2_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeAx),.poY(planeAy),
	.trigger(bA2_t),.timer(timer),.d(1),.bullet(bA2)
);bullet bA3_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeAx),.poY(planeAy),
	.trigger(bA3_t),.timer(timer),.d(1),.bullet(bA3)
);bullet bA4_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeAx),.poY(planeAy),
	.trigger(bA4_t),.timer(timer),.d(1),.bullet(bA4)
);bullet bA5_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeAx),.poY(planeAy),
	.trigger(bA5_t),.timer(timer),.d(1),.bullet(bA5)
);bullet bA6_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeAx),.poY(planeAy),
	.trigger(bA6_t),.timer(timer),.d(1),.bullet(bA6)
);bullet bA7_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeAx),.poY(planeAy),
	.trigger(bA7_t),.timer(timer),.d(1),.bullet(bA7)
);bullet bA8_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeAx),.poY(planeAy),
	.trigger(bA8_t),.timer(timer),.d(1),.bullet(bA8)
);bullet bA9_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeAx),.poY(planeAy),
	.trigger(bA9_t),.timer(timer),.d(1),.bullet(bA9)
);bullet bA10_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeAx),.poY(planeAy),
	.trigger(bA10_t),.timer(timer),.d(1),.bullet(bA10)
);bullet bA11_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeAx),.poY(planeAy),
	.trigger(bA11_t),.timer(timer),.d(1),.bullet(bA11)
);bullet bA12_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeAx),.poY(planeAy),
	.trigger(bA12_t),.timer(timer),.d(1),.bullet(bA12)
);bullet bA13_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeAx),.poY(planeAy),
	.trigger(bA13_t),.timer(timer),.d(1),.bullet(bA13)
);bullet bA14_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeAx),.poY(planeAy),
	.trigger(bA14_t),.timer(timer),.d(1),.bullet(bA14)
);bullet bA15_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeAx),.poY(planeAy),
	.trigger(bA15_t),.timer(timer),.d(1),.bullet(bA15)
);bullet bA16_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeAx),.poY(planeAy),
	.trigger(bA16_t),.timer(timer),.d(1),.bullet(bA16)
);bullet bA17_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeAx),.poY(planeAy),
	.trigger(bA17_t),.timer(timer),.d(1),.bullet(bA17)
);bullet bA18_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeAx),.poY(planeAy),
	.trigger(bA18_t),.timer(timer),.d(1),.bullet(bA18)
);bullet bA19_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeAx),.poY(planeAy),
	.trigger(bA19_t),.timer(timer),.d(1),.bullet(bA19)
);bullet bA20_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeAx),.poY(planeAy),
	.trigger(bA20_t),.timer(timer),.d(1),.bullet(bA20)
);

bullet bB1_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeBx),.poY(planeBy),
	.trigger(bB1_t),.timer(timer),.d(0),.bullet(bB1)
);
bullet bB2_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeBx),.poY(planeBy),
	.trigger(bB2_t),.timer(timer),.d(0),.bullet(bB2)
);bullet bB3_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeBx),.poY(planeBy),
	.trigger(bB3_t),.timer(timer),.d(0),.bullet(bB3)
);bullet bB4_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeBx),.poY(planeBy),
	.trigger(bB4_t),.timer(timer),.d(0),.bullet(bB4)
);bullet bB5_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeBx),.poY(planeBy),
	.trigger(bB5_t),.timer(timer),.d(0),.bullet(bB5)
);bullet bB6_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeBx),.poY(planeBy),
	.trigger(bB6_t),.timer(timer),.d(0),.bullet(bB6)
);bullet bB7_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeBx),.poY(planeBy),
	.trigger(bB7_t),.timer(timer),.d(0),.bullet(bB7)
);bullet bB8_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeBx),.poY(planeBy),
	.trigger(bB8_t),.timer(timer),.d(0),.bullet(bB8)
);bullet bB9_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeBx),.poY(planeBy),
	.trigger(bB9_t),.timer(timer),.d(0),.bullet(bB9)
);bullet bB10_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeBx),.poY(planeBy),
	.trigger(bB10_t),.timer(timer),.d(0),.bullet(bB10)
);bullet bB11_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeBx),.poY(planeBy),
	.trigger(bB11_t),.timer(timer),.d(0),.bullet(bB11)
);bullet bB12_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeBx),.poY(planeBy),
	.trigger(bB12_t),.timer(timer),.d(0),.bullet(bB12)
);bullet bB13_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeBx),.poY(planeBy),
	.trigger(bB13_t),.timer(timer),.d(0),.bullet(bB13)
);bullet bB14_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeBx),.poY(planeBy),
	.trigger(bB14_t),.timer(timer),.d(0),.bullet(bB14)
);bullet bB15_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeBx),.poY(planeBy),
	.trigger(bB15_t),.timer(timer),.d(0),.bullet(bB15)
);bullet bB16_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeBx),.poY(planeBy),
	.trigger(bB16_t),.timer(timer),.d(0),.bullet(bB16)
);bullet bB17_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeBx),.poY(planeBy),
	.trigger(bB17_t),.timer(timer),.d(0),.bullet(bB17)
);bullet bB18_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeBx),.poY(planeBy),
	.trigger(bB18_t),.timer(timer),.d(0),.bullet(bB18)
);bullet bB19_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeBx),.poY(planeBy),
	.trigger(bB19_t),.timer(timer),.d(0),.bullet(bB19)
);bullet bB20_m(
	.clk(clk),.rst(rst),.x(x),.y(y),.poX(planeBx),.poY(planeBy),
	.trigger(bB20_t),.timer(timer),.d(0),.bullet(bB20)
);


wire [6:0] a0, a1, a2, a3, a4, a5, a6;
wire [6:0] b0, b1, b2, b3, b4, b5, b6;
wire [6:0] e0, e1, e2, e3, e4, e5, e6;
assign a0 = 8;
assign a1 = 20;
assign a2 = 34;
assign a3 = 65;
assign a4 = 127;
assign a5 = 65;
assign a6 = 65;
assign b0 = 60;
assign b1 = 34;
assign b2 = 36;
assign b3 = 62;
assign b4 = 35;
assign b5 = 35;
assign b6 = 60;
assign e0 = 0;
assign e1 = 30;
assign e2 = 0;
assign e3 = 0;
assign e4 = 0;
assign e5 = 30;
assign e6 = 0;
parameter aX = 200, aY= 300, bX= 600 ,bY= 300, eX = 400, eY = 300;
// a
always@(posedge clk, posedge rst)
begin
	if(rst) a <= 0;
	else begin
		if(x >= aX && x < aX+7)
			case(y-aY)
				0:a <= a0[x-aX];
				1:a <= a1[x-aX];
				2:a <= a2[x-aX];
				3:a <= a3[x-aX];
				4:a <= a4[x-aX];
				5:a <= a5[x-aX];
				6:a <= a6[x-aX];
				default:a <=0;
			endcase
		else a <= 0;
	end
end
// b
always@(posedge clk, posedge rst)
begin
	if(rst) b <= 0;
	else begin
		if(bX>=x &&  bX<=x+6)
			case(y-bY)
				0:b <= b0[bX-x];
				1:b <= b1[bX-x];
				2:b <= b2[bX-x];
				3:b <= b3[bX-x];
				4:b <= b4[bX-x];
				5:b <= b5[bX-x];
				6:b <= b6[bX-x];
				default:b <=0;
			endcase
		else b <= 0;
	end
end
// equ
always@(posedge clk, posedge rst)
begin
	if(rst) equ <= 0;
	else begin
		if(x >= eX && x < eX+7)
			case(y-bY)
				0:equ <= e0[x-eX];
				1:equ <= e1[x-eX];
				2:equ <= e2[x-eX];
				3:equ <= e3[x-eX];
				4:equ <= e4[x-eX];
				5:equ <= e5[x-eX];
				6:equ <= e6[x-eX];
				default:equ <=0;
			endcase
		else equ <= 0;
	end
end


endmodule
