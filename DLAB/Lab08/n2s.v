`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:52:17 12/13/2016 
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
    input rst,
    input [7:0] num,
    input deal,
    output [127:0] str
    );

wire [399:0] uStr, dStr;
reg [399:0] uAns, dAns;
reg [30:0] counter;
wire [3:0] b [2:0];
wire [7:0] tmp;
wire rfd1, rfd2;

assign str = (deal)? uAns:dAns;
div div1 (
    .clk(clk), // input clk
    .rfd(rfd1), // output rfd
    .dividend(num), // input [7 : 0] dividend
    .divisor(8'd10), // input [7 : 0] divisor
    .quotient(tmp), // output [7 : 0] quotient
    .fractional(b[0])
);
div div2 (
    .clk(clk), // input clk
    .rfd(rfd2), // output rfd
    .dividend(tmp), // input [7 : 0] dividend
    .divisor(8'd10), // input [7 : 0] divisor
    .quotient(b[2]), // output [7 : 0] quotient
    .fractional(b[1])
);
assign uStr = {"                Last answer=",8'h30+b[2],8'h30+b[1],8'h30+b[0],"                   "};
assign dStr = {"                Current answer=",8'h30+b[2],8'h30+b[1],8'h30+b[0],"                "};

// counter
always@(posedge clk, posedge rst)
begin
		if(rst) counter <= 0;
		else counter <= (counter[28:23] < 34)? counter+1 : 0;
end

// uAns
always@(posedge clk, posedge rst)
begin
    if(rst) uAns <= uStr;
    else begin
        case(counter[28:23])
            0 : uAns <= {uStr[399:272]};
            1 : uAns <= {uStr[391:264]};
            2 : uAns <= {uStr[383:256]};
            3 : uAns <= {uStr[375:248]};
						4 : uAns <= {uStr[367:240]};
            5 : uAns <= {uStr[359:232]};
            6 : uAns <= {uStr[351:224]};
            7 : uAns <= {uStr[343:216]};
            8 : uAns <= {uStr[335:208]};
            9 : uAns <= {uStr[327:200]};
            10: uAns <= {uStr[319:192]};
            11: uAns <= {uStr[311:184]};
            12: uAns <= {uStr[303:176]};
            13: uAns <= {uStr[295:168]};
            14: uAns <= {uStr[287:160]};
            15: uAns <= {uStr[279:152]};
            16: uAns <= {uStr[271:144]};
            17: uAns <= {uStr[263:136]};
            18: uAns <= {uStr[255:128]};
            19: uAns <= {uStr[247:120]};
            10: uAns <= {uStr[239:112]};
            21: uAns <= {uStr[231:104]};
            22: uAns <= {uStr[223:96 ]};
            23: uAns <= {uStr[215:88 ]};
            24: uAns <= {uStr[207:80 ]};
            25: uAns <= {uStr[199:72 ]};
            26: uAns <= {uStr[191:64 ]};
            27: uAns <= {uStr[183:56 ]};
            28: uAns <= {uStr[175:48 ]};
            29: uAns <= {uStr[167:40 ]};
						30: uAns <= {uStr[159:32 ]};
            31: uAns <= {uStr[151:24 ]};
						32: uAns <= {uStr[143:16 ]};
						33: uAns <= {uStr[135:8  ]};
						default: uAns <= uAns;
        endcase
    end
end

// dAns
always@(posedge clk, posedge rst)
begin
    if(rst) dAns <= dStr;
    else begin
        case(counter[28:23])
            0 : dAns <= {dStr[135:8  ]};
            1 : dAns <= {dStr[143:16 ]};
            2 : dAns <= {dStr[151:24 ]};
            3 : dAns <= {dStr[159:32 ]};
						4 : dAns <= {dStr[167:40 ]};
            5 : dAns <= {dStr[175:48 ]};
            6 : dAns <= {dStr[183:56 ]};
            7 : dAns <= {dStr[191:64 ]};
            8 : dAns <= {dStr[199:72 ]};
            9 : dAns <= {dStr[207:80 ]};
            10: dAns <= {dStr[215:88 ]};
            11: dAns <= {dStr[223:96 ]};
            12: dAns <= {dStr[231:104]};
            13: dAns <= {dStr[239:112]};
            14: dAns <= {dStr[247:120]};
            15: dAns <= {dStr[255:128]};
            16: dAns <= {dStr[263:136]};
            17: dAns <= {dStr[271:144]};
            18: dAns <= {dStr[279:152]};
            19: dAns <= {dStr[287:160]};
            10: dAns <= {dStr[295:168]};
            21: dAns <= {dStr[303:176]};
            22: dAns <= {dStr[311:184]};
            23: dAns <= {dStr[319:192]};
            24: dAns <= {dStr[327:200]};
            25: dAns <= {dStr[335:208]};
            26: dAns <= {dStr[343:216]};
            27: dAns <= {dStr[351:224]};
            28: dAns <= {dStr[359:232]};
            29: dAns <= {dStr[367:240]};
						30: dAns <= {dStr[375:248]};
            31: dAns <= {dStr[383:256]};
						32: dAns <= {dStr[391:264]};
						33: dAns <= {dStr[399:272]};
						default: dAns <= dAns;
        endcase
    end
end

endmodule