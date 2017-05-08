module MODE0(outR, outI, a, b);

input [15:0] a, b;
output signed [17:0] outR, outI;

wire signed [7:0] aR, aI;
wire signed [7:0] bR, bI;
wire signed [17:0] r1, r2;
wire signed [17:0] i1, i2;

assign aR = a[15:8]; assign aI = a[7:0];
assign bR = b[15:8]; assign bI = b[7:0];
assign r1 = aR*bR; assign r2 = aI*bI;
assign i1 = aR*bI; assign i2 = aI*bR;

assign outR = r1 - r2;
assign outI = i1 + i2;

endmodule

module Online_test2(	
	clk, 
	rst_n, 
	in_valid, 
	in,
	in_mode,	
	out_valid, 
	out
);
				
//---------------------------------
//  input and output declaration
//---------------------------------  

input              clk;
input              rst_n;
input              in_valid;
input 	[15:0]     in;
input 	           in_mode;
output reg         out_valid;
output reg [35:0]  out;

//----------------------------------
// reg and wire declaration
//--------------------------------- 
 
reg inMod;
reg rstState;
reg [5:0] cnt1, cnt2;
reg [15:0] a0, b0, a1, b1;
reg signed [17:0] rea, img;
reg [35:0] o0, o2, o4, o6, o8, o10;

wire signed [17:0] m00R, m00I, m01R, m01I, m10R, m10I, m11R, m11I;
wire [3:0] a01, a02, a03, a04;
wire [3:0] a11, a12, a13, a14;
wire [3:0] b01, b02, b03, b04;
wire [3:0] b11, b12, b13, b14;

//---------------------------------
//   parameter declaration
//---------------------------------  
 
MODE0 m00(m00R,m00I,a0,b0);
MODE0 m01(m01R,m01I,a0,b1);
MODE0 m10(m10R,m10I,a1,b0);
MODE0 m11(m11R,m11I,a1,b1);
 
assign a01 = a0[15:12]; assign a02 = a0[11:8]; assign a03 = a0[7:4]; assign a04 = a0[3:0];
assign a11 = a1[15:12]; assign a12 = a1[11:8]; assign a13 = a1[7:4]; assign a14 = a1[3:0];
assign b01 = b0[15:12]; assign b02 = b0[11:8]; assign b03 = b0[7:4]; assign b04 = b0[3:0];
assign b11 = b1[15:12]; assign b12 = b1[11:8]; assign b13 = b1[7:4]; assign b14 = b1[3:0];

//----------------------------------
//
//         My design
//
//----------------------------------

always@(posedge clk) begin
	if(in_mode == 1) inMod = 1; else;
	if(in_mode == 0) inMod = 0; else;
	if(rst_n == 1 || rstState == 1) begin
		out_valid = 0;
		out = 0;
		rstState = 0;
		cnt1 = 0;
		cnt2 = 0;
		o0 = 0; o2 = 0; o4 = 0; o6 = 0; o8 = 0; o10 = 0;
	end
	else;
	if(in_valid == 1) begin
		cnt1 = cnt1+1;
		case(cnt1)
			1: a0 = in;
			2: a1 = in;
			3: b0 = in;
			4: b1 = in;
			default:;
		endcase
	end
	else;
	if(cnt1 > 0 && in_valid == 0) begin
		cnt2 = cnt2+1;
		case(inMod)
			0: begin
				case(cnt2)
					1: begin
						out[35:18] = m00R;
						out[17:0] = m00I;
						out_valid = 1;
					end
					2: begin
						rea = m01R + m10R;
						img = m01I + m10I;
						out[35:18] = rea;
						out[17:0] = img;
						out_valid = 1;
					end
					3: begin
						out[35:18] = m11R;
						out[17:0] = m11I;
						out_valid = 1;
					end
					default: begin
						rstState = 1;
						out_valid = 0;
					end
				endcase
			end
			1: begin
				case(cnt2)
					1: begin
						case(a01)
							0: o0 = o0+1;
							2: o2 = o2+1;
							4: o4 = o4+1;
							6: o6 = o6+1;
							8: o8 = o8+1;
							10: o10 = o10+1;
						endcase
						case(a02)
							0: o0 = o0+1;
							2: o2 = o2+1;
							4: o4 = o4+1;
							6: o6 = o6+1;
							8: o8 = o8+1;
							10: o10 = o10+1;
						endcase
						case(a03)
							0: o0 = o0+1;
							2: o2 = o2+1;
							4: o4 = o4+1;
							6: o6 = o6+1;
							8: o8 = o8+1;
							10: o10 = o10+1;
						endcase
						case(a04)
							0: o0 = o0+1;
							2: o2 = o2+1;
							4: o4 = o4+1;
							6: o6 = o6+1;
							8: o8 = o8+1;
							10: o10 = o10+1;
						endcase
						case(a11)
							0: o0 = o0+1;
							2: o2 = o2+1;
							4: o4 = o4+1;
							6: o6 = o6+1;
							8: o8 = o8+1;
							10: o10 = o10+1;
						endcase
						case(a12)
							0: o0 = o0+1;
							2: o2 = o2+1;
							4: o4 = o4+1;
							6: o6 = o6+1;
							8: o8 = o8+1;
							10: o10 = o10+1;
						endcase
						case(a13)
							0: o0 = o0+1;
							2: o2 = o2+1;
							4: o4 = o4+1;
							6: o6 = o6+1;
							8: o8 = o8+1;
							10: o10 = o10+1;
						endcase
						case(a14)
							0: o0 = o0+1;
							2: o2 = o2+1;
							4: o4 = o4+1;
							6: o6 = o6+1;
							8: o8 = o8+1;
							10: o10 = o10+1;
						endcase
						case(b01)
							0: o0 = o0+1;
							2: o2 = o2+1;
							4: o4 = o4+1;
							6: o6 = o6+1;
							8: o8 = o8+1;
							10: o10 = o10+1;
						endcase
						case(b02)
							0: o0 = o0+1;
							2: o2 = o2+1;
							4: o4 = o4+1;
							6: o6 = o6+1;
							8: o8 = o8+1;
							10: o10 = o10+1;
						endcase
						case(b03)
							0: o0 = o0+1;
							2: o2 = o2+1;
							4: o4 = o4+1;
							6: o6 = o6+1;
							8: o8 = o8+1;
							10: o10 = o10+1;
						endcase
						case(b04)
							0: o0 = o0+1;
							2: o2 = o2+1;
							4: o4 = o4+1;
							6: o6 = o6+1;
							8: o8 = o8+1;
							10: o10 = o10+1;
						endcase
						case(b11)
							0: o0 = o0+1;
							2: o2 = o2+1;
							4: o4 = o4+1;
							6: o6 = o6+1;
							8: o8 = o8+1;
							10: o10 = o10+1;
						endcase
						case(b12)
							0: o0 = o0+1;
							2: o2 = o2+1;
							4: o4 = o4+1;
							6: o6 = o6+1;
							8: o8 = o8+1;
							10: o10 = o10+1;
						endcase
						case(b13)
							0: o0 = o0+1;
							2: o2 = o2+1;
							4: o4 = o4+1;
							6: o6 = o6+1;
							8: o8 = o8+1;
							10: o10 = o10+1;
						endcase
						case(b14)
							0: o0 = o0+1;
							2: o2 = o2+1;
							4: o4 = o4+1;
							6: o6 = o6+1;
							8: o8 = o8+1;
							10: o10 = o10+1;
						endcase
						case(a01)
							0: o0 = o0+1;
							2: o2 = o2+1;
							4: o4 = o4+1;
							6: o6 = o6+1;
							8: o8 = o8+1;
							10: o10 = o10+1;
						endcase
					end
					2: begin
						out = o0;
						out_valid = 1;
					end
					3: begin
						out = o2;
						out_valid = 1;
					end
					4: begin
						out = o4;
						out_valid = 1;
					end
					5: begin
						out = o6;
						out_valid = 1;
					end
					6: begin
						out = o8;
						out_valid = 1;
					end
					7: begin
						out = o10;
						out_valid = 1;
					end
					default: begin
						rstState = 1;
						out_valid = 0;
					end
				endcase
			end
			default:;
		endcase
	end
	else;
end

endmodule
