`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:02:57 01/08/2017 
// Design Name: 
// Module Name:    number 
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
module number(
	input clk,
	input rst,
	input [3:0] num,
	input [10:0] x,
	input [10:0] y,
	input [10:0] poX,
	input [10:0] poY,
	output reg pic
    );

wire [5:0] n00,n01,n02,n03,n04,n05;
wire [5:0] n10,n11,n12,n13,n14,n15;
wire [5:0] n20,n21,n22,n23,n24,n25;
wire [5:0] n30,n31,n32,n33,n34,n35;
wire [5:0] n40,n41,n42,n43,n44,n45;
wire [5:0] n50,n51,n52,n53,n54,n55;
wire [5:0] n60,n61,n62,n63,n64,n65;
wire [5:0] n70,n71,n72,n73,n74,n75;
wire [5:0] n80,n81,n82,n83,n84,n85;
wire [5:0] n90,n91,n92,n93,n94,n95;

//0
assign n00 = 30;
assign n01 = 18;
assign n02 = 18;
assign n03 = 18;
assign n04 = 18;
assign n05 = 30;
//1
assign n10 = 4;
assign n11 = 12;
assign n12 = 4;
assign n13 = 4;
assign n14 = 4;
assign n15 = 4;
//2
assign n20 = 12;
assign n21 = 18;
assign n22 = 1;
assign n23 = 2;
assign n24 = 12;
assign n25 = 63;
//3
assign n30 = 28;
assign n31 = 18;
assign n32 = 2;
assign n33 = 12;
assign n34 = 2;
assign n35 = 28;
//4
assign n40 = 10;
assign n41 = 18;
assign n42 = 18;
assign n43 = 31;
assign n44 = 2;
assign n45 = 2;
//5
assign n50 = 30;
assign n51 = 16;
assign n52 = 30;
assign n53 = 2;
assign n54 = 2;
assign n55 = 30;
//6
assign n60 = 12;
assign n61 = 18;
assign n62 = 16;
assign n63 = 30;
assign n64 = 18;
assign n65 = 30;
//7
assign n70 = 30;
assign n71 = 18;
assign n72 = 6;
assign n73 = 4;
assign n74 = 12;
assign n75 = 8;
//8
assign n80 = 30;
assign n81 = 18;
assign n82 = 30;
assign n83 = 18;
assign n84 = 18;
assign n85 = 30;
//9
assign n90 = 30;
assign n91 = 18;
assign n92 = 18;
assign n93 = 30;
assign n94 = 2;
assign n95 = 2;

// pic
always@(posedge clk, posedge rst)
begin
	if(rst) pic <= 0;
	else begin
		if(poX>=x && poX<=x+5) begin
			case(num)
			0: begin
				case(y-poY)
				0:pic <= n00[poX-x];
				1:pic <= n01[poX-x];
				2:pic <= n02[poX-x];
				3:pic <= n03[poX-x];
				4:pic <= n04[poX-x];
				5:pic <= n05[poX-x];
				default:pic<=0;
				endcase
			end
			1: begin
				case(y-poY)
				0:pic <= n10[poX-x];
				1:pic <= n11[poX-x];
				2:pic <= n12[poX-x];
				3:pic <= n13[poX-x];
				4:pic <= n14[poX-x];
				5:pic <= n15[poX-x];
				default:pic<=0;
				endcase
			end
			2: begin
				case(y-poY)
				0:pic <= n20[poX-x];
				1:pic <= n21[poX-x];
				2:pic <= n22[poX-x];
				3:pic <= n23[poX-x];
				4:pic <= n24[poX-x];
				5:pic <= n25[poX-x];
				default:pic<=0;
				endcase
			end
			3: begin
				case(y-poY)
				0:pic <= n30[poX-x];
				1:pic <= n31[poX-x];
				2:pic <= n32[poX-x];
				3:pic <= n33[poX-x];
				4:pic <= n34[poX-x];
				5:pic <= n35[poX-x];
				default:pic<=0;
				endcase
			end
			4: begin
				case(y-poY)
				0:pic <= n40[poX-x];
				1:pic <= n41[poX-x];
				2:pic <= n42[poX-x];
				3:pic <= n43[poX-x];
				4:pic <= n44[poX-x];
				5:pic <= n45[poX-x];
				default:pic<=0;
				endcase
			end
			5: begin
				case(y-poY)
				0:pic <= n50[poX-x];
				1:pic <= n51[poX-x];
				2:pic <= n52[poX-x];
				3:pic <= n53[poX-x];
				4:pic <= n54[poX-x];
				5:pic <= n55[poX-x];
				default:pic<=0;
				endcase
			end
			6: begin
				case(y-poY)
				0:pic <= n60[poX-x];
				1:pic <= n61[poX-x];
				2:pic <= n62[poX-x];
				3:pic <= n63[poX-x];
				4:pic <= n64[poX-x];
				5:pic <= n65[poX-x];
				default:pic<=0;
				endcase
			end
			7: begin
				case(y-poY)
				0:pic <= n70[poX-x];
				1:pic <= n71[poX-x];
				2:pic <= n72[poX-x];
				3:pic <= n73[poX-x];
				4:pic <= n74[poX-x];
				5:pic <= n75[poX-x];
				default:pic<=0;
				endcase
			end
			8: begin
				case(y-poY)
				0:pic <= n80[poX-x];
				1:pic <= n81[poX-x];
				2:pic <= n82[poX-x];
				3:pic <= n83[poX-x];
				4:pic <= n84[poX-x];
				5:pic <= n85[poX-x];
				default:pic<=0;
				endcase
			end
			9: begin
				case(y-poY)
				0:pic <= n90[poX-x];
				1:pic <= n91[poX-x];
				2:pic <= n92[poX-x];
				3:pic <= n93[poX-x];
				4:pic <= n94[poX-x];
				5:pic <= n95[poX-x];
				default:pic<=0;
				endcase
			end
			default: pic <= 0;
			endcase
		end else pic<=0;
	end
end

endmodule
