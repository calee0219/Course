`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:31:50 12/21/2015 
// Design Name: 
// Module Name:    Xmas 
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
module Xmas(
	output red,
	output green,
	output blue,
	output hsync,
	output vsync,
	input rst,
	input clk
    );

parameter leftX   = 104;
parameter rightX  = 904;
parameter centerX = 504;
parameter topY    = 24;
parameter downY   = 632;
parameter centerY = 328;

// tree
parameter rw  =  70; // root's width
parameter rh  = 150; // root's high
parameter l1d = 482; // leaf1's down position
parameter l1m = 175; // max high of leaf1
parameter l2d = 307; // leaf2's down position
parameter l2m = 125; // max high of leaf2
parameter l3d = 182; // leaf3's down position
parameter l3m =  75; // max high of leaf3

// star
parameter s1t = 482;
parameter s1l = 329;
parameter s1r = 679;
parameter s2t = 307;
parameter s2l = 379;
parameter s2r = 629;
parameter s3t = 182;
parameter s3l = 429;
parameter s3r = 579;
parameter s4t =  90;

parameter bst=50;
parameter bs1=200;
parameter bs2=700;

parameter snow1x = 150;
parameter snow2x = 250;
parameter snow3x = 650;
parameter snow4x = 750;
parameter snow1y = 382;
parameter snow2y = 182;
parameter snow3y = 482;
parameter snow4y = 282;

reg [20:0] x, y;
wire signed [20:0] xx,yy;
wire [10:0] vis;
reg R, G, B;
reg root;
reg leaf1, leaf2, leaf3;
reg star1l, star1r, star2l, star2r, star3l, star3r, star4;
reg [30:0] count;
wire [12:0] st0,st1,st2,st3,st4,st5,st6,st7,st8,st9,st10,st11,st12;
wire [70:0] bst0;wire [70:0] bst1;wire [70:0] bst2;wire [70:0] bst3;wire [70:0] bst4;wire [70:0] bst5;wire [70:0] bst6;wire [70:0] bst7;wire [70:0] bst8;wire [70:0] bst9;wire [70:0] bst10;wire [70:0] bst11;wire [70:0] bst12;wire [70:0] bst13;wire [70:0] bst14;wire [70:0] bst15;wire [70:0] bst16;wire [70:0] bst17;wire [70:0] bst18;wire [70:0] bst19;wire [70:0] bst20;wire [70:0] bst21;wire [70:0] bst22;wire [70:0] bst23;wire [70:0] bst24;wire [70:0] bst25;wire [70:0] bst26;wire [70:0] bst27;wire [70:0] bst28;wire [70:0] bst29;wire [70:0] bst30;wire [70:0] bst31;wire [70:0] bst32;wire [70:0] bst33;wire [70:0] bst34;wire [70:0] bst35;wire [70:0] bst36;wire [70:0] bst37;wire [70:0] bst38;wire [70:0] bst39;wire [70:0] bst40;wire [70:0] bst41;wire [70:0] bst42;wire [70:0] bst43;wire [70:0] bst44;wire [70:0] bst45;wire [70:0] bst46;wire [70:0] bst47;wire [70:0] bst48;wire [70:0] bst49;wire [70:0] bst50;wire [70:0] bst51;wire [70:0] bst52;wire [70:0] bst53;wire [70:0] bst54;wire [70:0] bst55;wire [70:0] bst56;wire [70:0] bst57;wire [70:0] bst58;wire [70:0] bst59;wire [70:0] bst60;wire [70:0] bst61;wire [70:0] bst62;wire [70:0] bst63;wire [70:0] bst64;wire [70:0] bst65;wire [70:0] bst66;wire [70:0] bst67;wire [70:0] bst68;wire [70:0] bst69;wire [70:0] bst70;wire [70:0] bst71;
wire bsg, bsb, bsr;
wire bsg2, bsb2, bsr2;
reg [20:0] timer;
wire [20:0] sn0,sn1,sn2,sn3,sn4,sn5,sn6,sn7,sn8,sn9,sn10,sn11,sn12,sn13,sn14,sn15,sn16,sn17,sn18,sn19,sn20,sn21;
reg snow1, snow2, snow3, snow4;
reg [10:0] down1,down2,down3,down4;
assign xx=x;
assign yy=(-1)*y;


reg signed [6:0] bs1move,bs2move;
//assign bs1move=timer[1]?-5:5;
//assign bs2move=timer[1]?-5:5;
always@(timer)begin
	case(timer[1:0])
		0:bs1move<=-5;
		1:bs1move<=-10;
		2:bs1move<=-5;
		3:bs1move<=0;
		default : bs1move<=0;
	endcase
end
always@(timer)begin
	case(timer[1:0])
		0:bs2move<=-5;
		1:bs2move<=-10;
		2:bs2move<=-5;
		3:bs2move<=0;
		default : bs2move<=0;
	endcase
end

wire tmp;
wire [20:0] tmp1,tmp2;
wire [20:0] THREE;
wire [20:0] mod3;
reg bstar1,bstar2;
assign THREE=3;
div MOD3 (
	.clk(clk), // input clk
	.rfd(tmp), // output rfd
	.dividend(timer), // input [20 : 0] dividend
	.divisor(THREE), // input [20 : 0] divisor
	.quotient(tmp2), // output [20 : 0] quotient
	.fractional(mod3)); // output [20 : 0] fractional
parameter PERIOD=25000000;
parameter CYCLE=62832;

assign red   = star1l||star1r||star2l||star2r
					||star3l||star3r||star4|| (bstar1&bsr)|| (bstar2&bsr2)
					|| snow1 || snow2 || snow3 || snow4;
assign green = leaf1 || leaf2 || leaf3 || star1l
					|| star1r|| star2l|| star2r|| star3l
					|| star3r|| star4 || (bstar1&bsg) || (bstar2&bsg2)
					|| snow1 || snow2 || snow3 || snow4;
assign blue  = vis & (bsb && bsb2 && ~root && ~leaf1 && ~leaf2 && ~leaf3 && 
					~((timer&1)&&star1l) && 
					~((timer&1)&&star1r) && 
					~((timer&1)&&star2l) && 
					~((timer&1)&&star2r) && 
					~((timer&1)&&star3l) && 
					~((timer&1)&&star3r) && 
					~((timer&1)&&star4)  
					);
assign hsync = ~( (x >= 919) && (x < 1039) );
assign vsync = ~( (y >= 659) && (y < 665) );
assign vis = ( (x >= 104) && (x < 904) && (y >= 23) && (y < 632) );
//STAR
assign st0 = 13'b0000001000000;
assign st1 = 13'b0000001000000;
assign st2 = 13'b0000001000000;
assign st3 = 13'b0000011100000;
assign st4 = 13'b0000011100000;
assign st5 = 13'b0011111111100;
assign st6 = 13'b0001111111000;
assign st7 = 13'b0000111110000;
assign st8 = 13'b0000111110000;
assign st9 = 13'b0000110110000;
assign st10 = 13'b0001000001000;
assign st11 = 13'b0000000000000;
assign st12 = 13'b0000000000000;

assign bsr = mod3[1:0] < 2? 1:0;
assign bsg = mod3[1:0] == 1? 1:0;
assign bsb = (mod3[1:0] == 1? 1:0)||(bstar1==0); 
assign bsr2 = mod3[1:0] < 2? 1:0;
assign bsg2 = mod3[1:0] == 1? 1:0;
assign bsb2 = (mod3[1:0] == 1? 1:0)||(bstar2==0); 
//big star
assign bst0 = 71'b00000000000000000000000000000000000100000000000000000000000000000000000;
assign bst1 = 71'b00000000000000000000000000000000000100000000000000000000000000000000000;
assign bst2 = 71'b00000000000000000000000000000000000100000000000000000000000000000000000;
assign bst3 = 71'b00000000000000000000000000000000000100000000000000000000000000000000000;
assign bst4 = 71'b00000000000000000000000000000000001110000000000000000000000000000000000;
assign bst5 = 71'b00000000000000000000000000000000001110000000000000000000000000000000000;
assign bst6 = 71'b00000000000000000000000000000000001110000000000000000000000000000000000;
assign bst7 = 71'b00000000000000000000000000000000011111000000000000000000000000000000000;
assign bst8 = 71'b00000000000000000000000000000000011111000000000000000000000000000000000;
assign bst9 = 71'b00000000000000000000000000000000011111000000000000000000000000000000000;
assign bst10 = 71'b00000000000000000000000000000000111111100000000000000000000000000000000;
assign bst11 = 71'b00000000000000000000000000000000111111100000000000000000000000000000000;
assign bst12 = 71'b00000000000000000000000000000000111111100000000000000000000000000000000;
assign bst13 = 71'b00000000000000000000000000000001111111110000000000000000000000000000000;
assign bst14 = 71'b00000000000000000000000000000001111111110000000000000000000000000000000;
assign bst15 = 71'b00000000000000000000000000000001111111110000000000000000000000000000000;
assign bst16 = 71'b00000000000000000000000000000011111111111000000000000000000000000000000;
assign bst17 = 71'b00000000000000000000000000000011111111111000000000000000000000000000000;
assign bst18 = 71'b00000000000000000000000000000011111111111000000000000000000000000000000;
assign bst19 = 71'b00000000000000000000000000000111111111111100000000000000000000000000000;
assign bst20 = 71'b00000000000000000000000000000111111111111100000000000000000000000000000;
assign bst21 = 71'b00000000000000000000000000000111111111111100000000000000000000000000000;
assign bst22 = 71'b00000000000000000000000000001111111111111110000000000000000000000000000;
assign bst23 = 71'b00000000000000000000000000001111111111111110000000000000000000000000000;
assign bst24 = 71'b00000000000000000000000000001111111111111110000000000000000000000000000;
assign bst25 = 71'b00000000000000000000000000011111111111111111000000000000000000000000000;
assign bst26 = 71'b00000000000000000000000000011111111111111111000000000000000000000000000;
assign bst27 = 71'b11111111111111111111111111111111111111111111111111111111111111111111111;
assign bst28 = 71'b01111111111111111111111111111111111111111111111111111111111111111111110;
assign bst29 = 71'b00111111111111111111111111111111111111111111111111111111111111111111100;
assign bst30 = 71'b00011111111111111111111111111111111111111111111111111111111111111111000;
assign bst31 = 71'b00000111111111111111111111111111111111111111111111111111111111111100000;
assign bst32 = 71'b00000011111111111111111111111111111111111111111111111111111111111000000;
assign bst33 = 71'b00000001111111111111111111111111111111111111111111111111111111110000000;
assign bst34 = 71'b00000000011111111111111111111111111111111111111111111111111111000000000;
assign bst35 = 71'b00000000001111111111111111111111111111111111111111111111111110000000000;
assign bst36 = 71'b00000000000011111111111111111111111111111111111111111111111000000000000;
assign bst37 = 71'b00000000000001111111111111111111111111111111111111111111110000000000000;
assign bst38 = 71'b00000000000000111111111111111111111111111111111111111111100000000000000;
assign bst39 = 71'b00000000000000001111111111111111111111111111111111111110000000000000000;
assign bst40 = 71'b00000000000000000111111111111111111111111111111111111100000000000000000;
assign bst41 = 71'b00000000000000000011111111111111111111111111111111111000000000000000000;
assign bst42 = 71'b00000000000000000000111111111111111111111111111111100000000000000000000;
assign bst43 = 71'b00000000000000000000011111111111111111111111111111000000000000000000000;
assign bst44 = 71'b00000000000000000000011111111111111111111111111111000000000000000000000;
assign bst45 = 71'b00000000000000000000011111111111111111111111111111000000000000000000000;
assign bst46 = 71'b00000000000000000000011111111111111111111111111111000000000000000000000;
assign bst47 = 71'b00000000000000000000111111111111111111111111111111100000000000000000000;
assign bst48 = 71'b00000000000000000000111111111111111111111111111111100000000000000000000;
assign bst49 = 71'b00000000000000000000111111111111111111111111111111100000000000000000000;
assign bst50 = 71'b00000000000000000001111111111111111111111111111111110000000000000000000;
assign bst51 = 71'b00000000000000000001111111111111111111111111111111110000000000000000000;
assign bst52 = 71'b00000000000000000001111111111111111111111111111111110000000000000000000;
assign bst53 = 71'b00000000000000000011111111111111111111111111111111111000000000000000000;
assign bst54 = 71'b00000000000000000011111111111111111011111111111111111000000000000000000;
assign bst55 = 71'b00000000000000000011111111111111100000111111111111111000000000000000000;
assign bst56 = 71'b00000000000000000111111111111111000000011111111111111100000000000000000;
assign bst57 = 71'b00000000000000000111111111111110000000001111111111111100000000000000000;
assign bst58 = 71'b00000000000000000111111111111000000000000011111111111100000000000000000;
assign bst59 = 71'b00000000000000001111111111110000000000000001111111111110000000000000000;
assign bst60 = 71'b00000000000000001111111111000000000000000000011111111110000000000000000;
assign bst61 = 71'b00000000000000001111111110000000000000000000001111111110000000000000000;
assign bst62 = 71'b00000000000000011111111100000000000000000000000111111111000000000000000;
assign bst63 = 71'b00000000000000011111110000000000000000000000000001111111000000000000000;
assign bst64 = 71'b00000000000000011111100000000000000000000000000000111111000000000000000;
assign bst65 = 71'b00000000000000111111000000000000000000000000000000011111100000000000000;
assign bst66 = 71'b00000000000000111100000000000000000000000000000000000111100000000000000;
assign bst67 = 71'b00000000000000111000000000000000000000000000000000000011100000000000000;
assign bst68 = 71'b00000000000001100000000000000000000000000000000000000000110000000000000;
assign bst69 = 71'b00000000000001000000000000000000000000000000000000000000010000000000000;
assign bst70 = 71'b00000000000000000000000000000000000000000000000000000000000000000000000;

// snow
assign sn0  = 21'b000000000010000000000;
assign sn1  = 21'b000000000010000000000;
assign sn2  = 21'b000000000010000000000;
assign sn3  = 21'b000000000010000000000;
assign sn4  = 21'b000100000010000001000;
assign sn5  = 21'b000010000111000010000;
assign sn6  = 21'b000011100111001110000;
assign sn7  = 21'b000001111111111100000;
assign sn8  = 21'b000000111111111000000;
assign sn9  = 21'b000000011111110000000;
assign sn10 = 21'b000001111111111100000;
assign sn11 = 21'b000111111111111111000;
assign sn12 = 21'b011111111111111111110;
assign sn13 = 21'b000000001111100000000;
assign sn14 = 21'b000000011101110000000;
assign sn15 = 21'b000000011000110000000;
assign sn16 = 21'b000000011000110000000;
assign sn17 = 21'b000000010000010000000;
assign sn18 = 21'b000000100000001000000;
assign sn19 = 21'b000001000000000100000;
assign sn20 = 21'b000000000000000000000;
assign sn21 = 21'b000000000000000000000;

//
//counter
always@(posedge clk or posedge rst)
begin
		if(rst) count<=0;
		else if(count==PERIOD) count<=0;
		else count<=count+1;
end
//timer

always@(posedge clk or posedge rst)
begin
	if(rst)timer<=0;
	else if(count==PERIOD && timer!=CYCLE) timer<=timer+1;
	else if(count==PERIOD && timer==CYCLE) timer<=0;
	else timer<=timer;
end

//down
always@(posedge clk or posedge rst)
begin
	if(rst)down1<=0;
	else if(count==PERIOD && (snow1y+down1)<=(downY-20)) 
	down1<=down1+5;
	else if(count==PERIOD) down1<=0;
	else down1<=down1;
end

always@(posedge clk or posedge rst)
begin
	if(rst)down2<=0;
	else if(count==PERIOD && (snow2y+down2)<=(downY-20)) 
	down2<=down2+5;
	else if(count==PERIOD) down2<=0;
	else down2<=down2;
end
always@(posedge clk or posedge rst)
begin
	if(rst)down3<=0;
	else if(count==PERIOD && (snow3y+down3)<=(downY-20)) 
	down3<=down3+5;
	else if(count==PERIOD) down3<=0;
	else down3<=down3;
end
always@(posedge clk or posedge rst)
begin
	if(rst)down4<=0;
	else if(count==PERIOD && (snow4y+down4)<=(downY-20)) 
	down4<=down4+5;
	else if(count==PERIOD) down4<=0;
	else down4<=down4;
end




// x
always @ (posedge clk, posedge rst)
begin
	if(rst) x <= 0;
	else begin
		x <= (x < 1039)? x+1 : 0;
	end
end

// y
always @ (posedge clk, posedge rst)
begin
	if(rst) y <= 0;
	else begin
		y <= (y == 665)? 0 : (x == 1039) ? y+1 : y;
	end
end

// root
always@(posedge clk, posedge rst)
begin
	if(rst) root <= 0;
	else begin
		if( (x >= centerX-(rw/2)) & (x < centerX+(rw/2)) & (y >= downY-rh) & (y < downY) ) root <= 1;
		else root <= 0;
	end
end

// leaf1
always@(posedge clk, posedge rst)
begin
	if(rst) leaf1 <= 0;
	else begin
		if( l1d >= y &
            ( ( x >= centerX & ( (x - centerX)+(l1d - y) ) <= l1m & ( (x - centerX)+(l1d - y) ) > 0 ) |
              ( x <= centerX & ( (centerX - x)+(l1d - y) ) <= l1m & ( (centerX - x)+(l1d - y) ) > 0 ) ) ) leaf1 <= 1;
		else leaf1 <= 0;
	end
end

// leaf2
always@(posedge clk, posedge rst)
begin
	if(rst) leaf2 <= 0;
	else begin
		if( l2d >= y &
            ( ( x >= centerX & ( (x - centerX)+(l2d - y) ) <= l2m & ( (x - centerX)+(l2d - y) ) > 0 ) |
              ( x <= centerX & ( (centerX - x)+(l2d - y) ) <= l2m & ( (centerX - x)+(l2d - y) ) > 0 ) ) ) leaf2 <= 1;
		else leaf2 <= 0;
	end
end

// leaf3
always@(posedge clk, posedge rst)
begin
	if(rst) leaf3 <= 0;
	else begin
		if( l3d >= y &
            ( ( x >= centerX & ( (x - centerX)+(l3d - y) ) <= l3m & ( (x - centerX)+(l3d - y) ) > 0 ) |
              ( x <= centerX & ( (centerX - x)+(l3d - y) ) <= l3m & ( (centerX - x)+(l3d - y) ) > 0 ) ) ) leaf3 <= 1;
		else leaf3 <= 0;
	end
end

// star1 left
always@(posedge clk, posedge rst)
begin
	if(rst) star1l <= 0;
	else begin
		if(x >= s1l && x <= s1l+12 &&
		   y >= s1t && y <= s1t+12) begin
			case(y-s1t)
				0 : star1l <= st0 [x-s1l];
				1 : star1l <= st1 [x-s1l];
				2 : star1l <= st2 [x-s1l];
				3 : star1l <= st3 [x-s1l];
				4 : star1l <= st4 [x-s1l];
				5 : star1l <= st5 [x-s1l];
				6 : star1l <= st6 [x-s1l];
				7 : star1l <= st7 [x-s1l];
				8 : star1l <= st8 [x-s1l];
				9 : star1l <= st9 [x-s1l];
				10: star1l <= st10[x-s1l];
				11: star1l <= st11[x-s1l];
				12: star1l <= st12[x-s1l];
			endcase
		end
		else star1l <= 0;
	end
end

// star1 right
always@(posedge clk, posedge rst)
begin
	if(rst) star1r <= 0;
	else begin
		if(x >= s1r && x <= s1r+12 &&
		   y >= s1t && y <= s1t+12) begin
			case(y-s1t)
				0 : star1r <= st0 [x-s1r];
				1 : star1r <= st1 [x-s1r];
				2 : star1r <= st2 [x-s1r];
				3 : star1r <= st3 [x-s1r];
				4 : star1r <= st4 [x-s1r];
				5 : star1r <= st5 [x-s1r];
				6 : star1r <= st6 [x-s1r];
				7 : star1r <= st7 [x-s1r];
				8 : star1r <= st8 [x-s1r];
				9 : star1r <= st9 [x-s1r];
				10: star1r <= st10[x-s1r];
				11: star1r <= st11[x-s1r];
				12: star1r <= st12[x-s1r];
			endcase
		end
		else star1r <= 0;
	end
end
// star2 left
always@(posedge clk, posedge rst)
begin
	if(rst) star2l <= 0;
	else begin
		if(x >= s2l && x <= s2l+12 &&
		   y >= s2t && y <= s2t+12) begin
			case(y-s2t)
				0 : star2l <= st0 [x-s2l];
				1 : star2l <= st1 [x-s2l];
				2 : star2l <= st2 [x-s2l];
				3 : star2l <= st3 [x-s2l];
				4 : star2l <= st4 [x-s2l];
				5 : star2l <= st5 [x-s2l];
				6 : star2l <= st6 [x-s2l];
				7 : star2l <= st7 [x-s2l];
				8 : star2l <= st8 [x-s2l];
				9 : star2l <= st9 [x-s2l];
				10: star2l <= st10[x-s2l];
				11: star2l <= st11[x-s2l];
				12: star2l <= st12[x-s2l];
			endcase
		end
		else star2l <= 0;
	end
end

// star2 right
always@(posedge clk, posedge rst)
begin
	if(rst) star2r <= 0;
	else begin
		if(x >= s2r && x <= s2r+12 &&
		   y >= s2t && y <= s2t+12) begin
			case(y-s2t)
				0 : star2r <= st0 [x-s2r];
				1 : star2r <= st1 [x-s2r];
				2 : star2r <= st2 [x-s2r];
				3 : star2r <= st3 [x-s2r];
				4 : star2r <= st4 [x-s2r];
				5 : star2r <= st5 [x-s2r];
				6 : star2r <= st6 [x-s2r];
				7 : star2r <= st7 [x-s2r];
				8 : star2r <= st8 [x-s2r];
				9 : star2r <= st9 [x-s2r];
				10: star2r <= st10[x-s2r];
				11: star2r <= st11[x-s2r];
				12: star2r <= st12[x-s2r];
			endcase
		end
		else star2r <= 0;
	end
end
// star3 left
always@(posedge clk, posedge rst)
begin
	if(rst) star3l <= 0;
	else begin
		if(x >= s3l && x <= s3l+12 &&
		   y >= s3t && y <= s3t+12) begin
			case(y-s3t)
				0 : star3l <= st0 [x-s3l];
				1 : star3l <= st1 [x-s3l];
				2 : star3l <= st2 [x-s3l];
				3 : star3l <= st3 [x-s3l];
				4 : star3l <= st4 [x-s3l];
				5 : star3l <= st5 [x-s3l];
				6 : star3l <= st6 [x-s3l];
				7 : star3l <= st7 [x-s3l];
				8 : star3l <= st8 [x-s3l];
				9 : star3l <= st9 [x-s3l];
				10: star3l <= st10[x-s3l];
				11: star3l <= st11[x-s3l];
				12: star3l <= st12[x-s3l];
			endcase
		end
		else star3l <= 0;
	end
end

// star3 right
always@(posedge clk, posedge rst)
begin
	if(rst) star3r <= 0;
	else begin
		if(x >= s3r && x <= s3r+12 &&
		   y >= s3t && y <= s3t+12) begin
			case(y-s3t)
				0 : star3r <= st0 [x-s3r];
				1 : star3r <= st1 [x-s3r];
				2 : star3r <= st2 [x-s3r];
				3 : star3r <= st3 [x-s3r];
				4 : star3r <= st4 [x-s3r];
				5 : star3r <= st5 [x-s3r];
				6 : star3r <= st6 [x-s3r];
				7 : star3r <= st7 [x-s3r];
				8 : star3r <= st8 [x-s3r];
				9 : star3r <= st9 [x-s3r];
				10: star3r <= st10[x-s3r];
				11: star3r <= st11[x-s3r];
				12: star3r <= st12[x-s3r];
			endcase
		end
		else star3r <= 0;
	end
end

// star4
always@(posedge clk, posedge rst)
begin
	if(rst) star4 <= 0;
	else begin
		if(x >= centerX-10  && x <= centerX +2 &&
		   y >= s4t && y <= s4t+12) begin
			case(y-s4t)
				0 : star4 <= st0 [x-centerX+10];
				1 : star4 <= st1 [x-centerX+10];
				2 : star4 <= st2 [x-centerX+10];
				3 : star4 <= st3 [x-centerX+10];
				4 : star4 <= st4 [x-centerX+10];
				5 : star4 <= st5 [x-centerX+10];
				6 : star4 <= st6 [x-centerX+10];
				7 : star4 <= st7 [x-centerX+10];
				8 : star4 <= st8 [x-centerX+10];
				9 : star4 <= st9 [x-centerX+10];
				10: star4 <= st10[x-centerX+10];
				11: star4 <= st11[x-centerX+10];
				12: star4 <= st12[x-centerX+10];
			endcase
		end
		else star4 <= 0;
	end
end

//big star left
always@(posedge clk or posedge rst)
begin
	if(rst) bstar1<=0;
	else 
	begin
		if(x>=bs1 && x<=bs1+70 &&
			y+bs1move>=bst && y+bs1move<=bst+70)begin
				case(y-bst+bs1move)
				0: bstar1 <= bst0 [x-bs1];
				1: bstar1 <= bst1 [x-bs1];
				2: bstar1 <= bst2 [x-bs1];
				3: bstar1 <= bst3 [x-bs1];
				4: bstar1 <= bst4 [x-bs1];
				5: bstar1 <= bst5 [x-bs1];
				6: bstar1 <= bst6 [x-bs1];
				7: bstar1 <= bst7 [x-bs1];
				8: bstar1 <= bst8 [x-bs1];
				9: bstar1 <= bst9 [x-bs1];
				10: bstar1 <= bst10 [x-bs1];
				11: bstar1 <= bst11 [x-bs1];
				12: bstar1 <= bst12 [x-bs1];
				13: bstar1 <= bst13 [x-bs1];
				14: bstar1 <= bst14 [x-bs1];
				15: bstar1 <= bst15 [x-bs1];
				16: bstar1 <= bst16 [x-bs1];
				17: bstar1 <= bst17 [x-bs1];
				18: bstar1 <= bst18 [x-bs1];
				19: bstar1 <= bst19 [x-bs1];
				20: bstar1 <= bst20 [x-bs1];
				21: bstar1 <= bst21 [x-bs1];
				22: bstar1 <= bst22 [x-bs1];
				23: bstar1 <= bst23 [x-bs1];
				24: bstar1 <= bst24 [x-bs1];
				25: bstar1 <= bst25 [x-bs1];
				26: bstar1 <= bst26 [x-bs1];
				27: bstar1 <= bst27 [x-bs1];
				28: bstar1 <= bst28 [x-bs1];
				29: bstar1 <= bst29 [x-bs1];
				30: bstar1 <= bst30 [x-bs1];
				31: bstar1 <= bst31 [x-bs1];
				32: bstar1 <= bst32 [x-bs1];
				33: bstar1 <= bst33 [x-bs1];
				34: bstar1 <= bst34 [x-bs1];
				35: bstar1 <= bst35 [x-bs1];
				36: bstar1 <= bst36 [x-bs1];
				37: bstar1 <= bst37 [x-bs1];
				38: bstar1 <= bst38 [x-bs1];
				39: bstar1 <= bst39 [x-bs1];
				40: bstar1 <= bst40 [x-bs1];
				41: bstar1 <= bst41 [x-bs1];
				42: bstar1 <= bst42 [x-bs1];
				43: bstar1 <= bst43 [x-bs1];
				44: bstar1 <= bst44 [x-bs1];
				45: bstar1 <= bst45 [x-bs1];
				46: bstar1 <= bst46 [x-bs1];
				47: bstar1 <= bst47 [x-bs1];
				48: bstar1 <= bst48 [x-bs1];
				49: bstar1 <= bst49 [x-bs1];
				50: bstar1 <= bst50 [x-bs1];
				51: bstar1 <= bst51 [x-bs1];
				52: bstar1 <= bst52 [x-bs1];
				53: bstar1 <= bst53 [x-bs1];
				54: bstar1 <= bst54 [x-bs1];
				55: bstar1 <= bst55 [x-bs1];
				56: bstar1 <= bst56 [x-bs1];
				57: bstar1 <= bst57 [x-bs1];
				58: bstar1 <= bst58 [x-bs1];
				59: bstar1 <= bst59 [x-bs1];
				60: bstar1 <= bst60 [x-bs1];
				61: bstar1 <= bst61 [x-bs1];
				62: bstar1 <= bst62 [x-bs1];
				63: bstar1 <= bst63 [x-bs1];
				64: bstar1 <= bst64 [x-bs1];
				65: bstar1 <= bst65 [x-bs1];
				66: bstar1 <= bst66 [x-bs1];
				67: bstar1 <= bst67 [x-bs1];
				68: bstar1 <= bst68 [x-bs1];
				69: bstar1 <= bst69 [x-bs1];
				70: bstar1 <= bst70 [x-bs1];
				71: bstar1 <= bst71 [x-bs1];
				endcase
			end
			else bstar1<=0;
	end
end
//big star right
always@(posedge clk or posedge rst)
begin
	if(rst)bstar2<=0;
	else begin
		if(x-bs2move>=bs2 && x-bs2move<=bs2+70 &&
			y>=bst && y<=bst+70)begin
				case(y-bst)
					
					0: bstar2 <= bst0 [x-bs2-bs2move];
					1: bstar2 <= bst1 [x-bs2-bs2move];
					2: bstar2 <= bst2 [x-bs2-bs2move];
					3: bstar2 <= bst3 [x-bs2-bs2move];	
					4: bstar2 <= bst4 [x-bs2-bs2move];
					5: bstar2 <= bst5 [x-bs2-bs2move];
					6: bstar2 <= bst6 [x-bs2-bs2move];
					7: bstar2 <= bst7 [x-bs2-bs2move];
					8: bstar2 <= bst8 [x-bs2-bs2move];
					9: bstar2 <= bst9 [x-bs2-bs2move];
					10: bstar2 <= bst10 [x-bs2-bs2move];
					11: bstar2 <= bst11 [x-bs2-bs2move];
					12: bstar2 <= bst12 [x-bs2-bs2move];
					13: bstar2 <= bst13 [x-bs2-bs2move];
					14: bstar2 <= bst14 [x-bs2-bs2move];
					15: bstar2 <= bst15 [x-bs2-bs2move];
					16: bstar2 <= bst16 [x-bs2-bs2move];
					17: bstar2 <= bst17 [x-bs2-bs2move];
					18: bstar2 <= bst18 [x-bs2-bs2move];
					19: bstar2 <= bst19 [x-bs2-bs2move];
					20: bstar2 <= bst20 [x-bs2-bs2move];
					21: bstar2 <= bst21 [x-bs2-bs2move];
					22: bstar2 <= bst22 [x-bs2-bs2move];
					23: bstar2 <= bst23 [x-bs2-bs2move];
					24: bstar2 <= bst24 [x-bs2-bs2move];
					25: bstar2 <= bst25 [x-bs2-bs2move];
					26: bstar2 <= bst26 [x-bs2-bs2move];
					27: bstar2 <= bst27 [x-bs2-bs2move];
					28: bstar2 <= bst28 [x-bs2-bs2move];
					29: bstar2 <= bst29 [x-bs2-bs2move];
					30: bstar2 <= bst30 [x-bs2-bs2move];
					31: bstar2 <= bst31 [x-bs2-bs2move];
					32: bstar2 <= bst32 [x-bs2-bs2move];
					33: bstar2 <= bst33 [x-bs2-bs2move];
					34: bstar2 <= bst34 [x-bs2-bs2move];
					35: bstar2 <= bst35 [x-bs2-bs2move];
					36: bstar2 <= bst36 [x-bs2-bs2move];
					37: bstar2 <= bst37 [x-bs2-bs2move];
					38: bstar2 <= bst38 [x-bs2-bs2move];
					39: bstar2 <= bst39 [x-bs2-bs2move];
					40: bstar2 <= bst40 [x-bs2-bs2move];
					41: bstar2 <= bst41 [x-bs2-bs2move];
					42: bstar2 <= bst42 [x-bs2-bs2move];
					43: bstar2 <= bst43 [x-bs2-bs2move];
					44: bstar2 <= bst44 [x-bs2-bs2move];
					45: bstar2 <= bst45 [x-bs2-bs2move];
					46: bstar2 <= bst46 [x-bs2-bs2move];
					47: bstar2 <= bst47 [x-bs2-bs2move];
					48: bstar2 <= bst48 [x-bs2-bs2move];
					49: bstar2 <= bst49 [x-bs2-bs2move];
					50: bstar2 <= bst50 [x-bs2-bs2move];
					51: bstar2 <= bst51 [x-bs2-bs2move];
					52: bstar2 <= bst52 [x-bs2-bs2move];
					53: bstar2 <= bst53 [x-bs2-bs2move];
					54: bstar2 <= bst54 [x-bs2-bs2move];
					55: bstar2 <= bst55 [x-bs2-bs2move];
					56: bstar2 <= bst56 [x-bs2-bs2move];
					57: bstar2 <= bst57 [x-bs2-bs2move];
					58: bstar2 <= bst58 [x-bs2-bs2move];
					59: bstar2 <= bst59 [x-bs2-bs2move];
					60: bstar2 <= bst60 [x-bs2-bs2move];
					61: bstar2 <= bst61 [x-bs2-bs2move];
					62: bstar2 <= bst62 [x-bs2-bs2move];
					63: bstar2 <= bst63 [x-bs2-bs2move];
					64: bstar2 <= bst64 [x-bs2-bs2move];
					65: bstar2 <= bst65 [x-bs2-bs2move];
					66: bstar2 <= bst66 [x-bs2-bs2move];
					67: bstar2 <= bst67 [x-bs2-bs2move];
					68: bstar2 <= bst68 [x-bs2-bs2move];
					69: bstar2 <= bst69 [x-bs2-bs2move];
					70: bstar2 <= bst70 [x-bs2-bs2move];
					71: bstar2 <= bst71 [x-bs2-bs2move];
				endcase
			end
		else bstar2<=0;	
	end
end

// snow1
always@(posedge clk, posedge rst)
begin
	if(rst) snow1 <= 0;
	else begin
		if(x >= snow1x-10  && x <= snow1x+10 &&
		   y >= snow1y+down1 && y <= snow1y+down1+20) begin
			case(y-snow1y-down1)
				0 : snow1 <= sn0 [x-snow1x+10];
				1 : snow1 <= sn1 [x-snow1x+10];
				2 : snow1 <= sn2 [x-snow1x+10];
				3 : snow1 <= sn3 [x-snow1x+10];
				4 : snow1 <= sn4 [x-snow1x+10];
				5 : snow1 <= sn5 [x-snow1x+10];
				6 : snow1 <= sn6 [x-snow1x+10];
				7 : snow1 <= sn7 [x-snow1x+10];
				8 : snow1 <= sn8 [x-snow1x+10];
				9 : snow1 <= sn9 [x-snow1x+10];
				10: snow1 <= sn10[x-snow1x+10];
				11: snow1 <= sn11[x-snow1x+10];
				12: snow1 <= sn12[x-snow1x+10];
				13: snow1 <= sn13[x-snow1x+10];
				14: snow1 <= sn14[x-snow1x+10];
				15: snow1 <= sn15[x-snow1x+10];
				16: snow1 <= sn16[x-snow1x+10];
				17: snow1 <= sn17[x-snow1x+10];
				18: snow1 <= sn18[x-snow1x+10];
				19: snow1 <= sn19[x-snow1x+10];
				20: snow1 <= sn20[x-snow1x+10];
				21: snow1 <= sn21[x-snow1x+10];
			endcase
		end
		else snow1 <= 0;
	end
end

// snow2
always@(posedge clk, posedge rst)
begin
	if(rst) snow2 <= 0;
	else begin
		if(x >= snow2x-10  && x <= snow2x+10 &&
		   y >= snow2y+down2 && y <= snow2y+down2+20) begin
			case(y-snow2y-down2)
				0 : snow2 <= sn0 [x-snow2x+10];
				1 : snow2 <= sn1 [x-snow2x+10];
				2 : snow2 <= sn2 [x-snow2x+10];
				3 : snow2 <= sn3 [x-snow2x+10];
				4 : snow2 <= sn4 [x-snow2x+10];
				5 : snow2 <= sn5 [x-snow2x+10];
				6 : snow2 <= sn6 [x-snow2x+10];
				7 : snow2 <= sn7 [x-snow2x+10];
				8 : snow2 <= sn8 [x-snow2x+10];
				9 : snow2 <= sn9 [x-snow2x+10];
				10: snow2 <= sn10[x-snow2x+10];
				11: snow2 <= sn11[x-snow2x+10];
				12: snow2 <= sn12[x-snow2x+10];
				13: snow2 <= sn13[x-snow2x+10];
				14: snow2 <= sn14[x-snow2x+10];
				15: snow2 <= sn15[x-snow2x+10];
				16: snow2 <= sn16[x-snow2x+10];
				17: snow2 <= sn17[x-snow2x+10];
				18: snow2 <= sn18[x-snow2x+10];
				19: snow2 <= sn19[x-snow2x+10];
				20: snow2 <= sn20[x-snow2x+10];
				21: snow2 <= sn21[x-snow2x+10];
			endcase
		end
		else snow2 <= 0;
	end
end
// snow3
always@(posedge clk, posedge rst)
begin
	if(rst) snow3 <= 0;
	else begin
		if(x >= snow3x-10  && x <= snow3x+10 &&
		   y >= snow3y+down3 && y <= snow3y+down3+20) begin
			case(y-snow3y-down3)
				0 : snow3 <= sn0 [x-snow3x+10];
				1 : snow3 <= sn1 [x-snow3x+10];
				2 : snow3 <= sn2 [x-snow3x+10];
				3 : snow3 <= sn3 [x-snow3x+10];
				4 : snow3 <= sn4 [x-snow3x+10];
				5 : snow3 <= sn5 [x-snow3x+10];
				6 : snow3 <= sn6 [x-snow3x+10];
				7 : snow3 <= sn7 [x-snow3x+10];
				8 : snow3 <= sn8 [x-snow3x+10];
				9 : snow3 <= sn9 [x-snow3x+10];
				10: snow3 <= sn10[x-snow3x+10];
				11: snow3 <= sn11[x-snow3x+10];
				12: snow3 <= sn12[x-snow3x+10];
				13: snow3 <= sn13[x-snow3x+10];
				14: snow3 <= sn14[x-snow3x+10];
				15: snow3 <= sn15[x-snow3x+10];
				16: snow3 <= sn16[x-snow3x+10];
				17: snow3 <= sn17[x-snow3x+10];
				18: snow3 <= sn18[x-snow3x+10];
				19: snow3 <= sn19[x-snow3x+10];
				20: snow3 <= sn20[x-snow3x+10];
				21: snow3 <= sn21[x-snow3x+10];
			endcase
		end
		else snow3 <= 0;
	end
end
// snow4
always@(posedge clk, posedge rst)
begin
	if(rst) snow4 <= 0;
	else begin
		if(x >= snow4x-10  && x <= snow4x+10 &&
		   y >= snow4y+down4 && y <= snow4y+down4+20) begin
			case(y-snow4y-down4)
				0 : snow4 <= sn0 [x-snow4x+10];
				1 : snow4 <= sn1 [x-snow4x+10];
				2 : snow4 <= sn2 [x-snow4x+10];
				3 : snow4 <= sn3 [x-snow4x+10];
				4 : snow4 <= sn4 [x-snow4x+10];
				5 : snow4 <= sn5 [x-snow4x+10];
				6 : snow4 <= sn6 [x-snow4x+10];
				7 : snow4 <= sn7 [x-snow4x+10];
				8 : snow4 <= sn8 [x-snow4x+10];
				9 : snow4 <= sn9 [x-snow4x+10];
				10: snow4 <= sn10[x-snow4x+10];
				11: snow4 <= sn11[x-snow4x+10];
				12: snow4 <= sn12[x-snow4x+10];
				13: snow4 <= sn13[x-snow4x+10];
				14: snow4 <= sn14[x-snow4x+10];
				15: snow4 <= sn15[x-snow4x+10];
				16: snow4 <= sn16[x-snow4x+10];
				17: snow4 <= sn17[x-snow4x+10];
				18: snow4 <= sn18[x-snow4x+10];
				19: snow4 <= sn19[x-snow4x+10];
				20: snow4 <= sn20[x-snow4x+10];
				21: snow4 <= sn21[x-snow4x+10];
			endcase
		end
		else snow4 <= 0;
	end
end

endmodule
