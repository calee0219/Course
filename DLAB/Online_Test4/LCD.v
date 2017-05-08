`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:10 12/18/2016 
// Design Name: 
// Module Name:    LCD 
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
module LCD(
    input clk,
    input rst,
    input [127:0] row_A,
    input [127:0] row_B,
    output LCD_E,
    output LCD_RS,
    output LCD_RW,
    output [3:0] LCD_D
    );
 reg lcd_inited;
 reg [3:0] init_d,icode,tcode,text_d;
 reg init_rs,init_rw,init_e;
 reg text_rs,text_rw,text_e;

 reg [23:0]init_count,text_count;
 
 assign LCD_E=(lcd_inited)?text_e:init_e;
 assign LCD_RS=(lcd_inited)?text_rs:init_rs;
 assign LCD_RW=(lcd_inited)?text_rw:init_rw;
 assign LCD_D=(lcd_inited)?text_d:init_d;
 
 always@(posedge clk or posedge rst) begin
    if(rst)begin
        init_count<=0;
        init_rs<=0;
        init_rw<=1;
        init_e<=0;
        init_d<=0;
        icode<=0;
        lcd_inited<=0;
    end
    else if(!lcd_inited)begin
        init_count<=init_count+1;
        init_e<=init_count[19];
        init_rw<=0;
        init_rs<=0;
        init_d<=icode;
        case(init_count[23:20])
        0:icode<=4'h3;
        1:icode<=4'h3;
        2:icode<=4'h3;
        3:icode<=4'h2;
        
        4:icode<=4'h2;
        5:icode<=4'h8;
        
        6:icode<=4'h0;
        7:icode<=4'h6;
        
        8:icode<=4'h0;
        9:icode<=4'hC;
        
        10:icode<=4'h0;
        11:icode<=4'h1;
        default:{init_rw,lcd_inited}<=2'b11;
        endcase
    end
 end
 
 always@(posedge clk or posedge rst)begin
    if(rst)begin
        text_e<=0;
        text_rs<=0;
        text_rw<=1;
        text_count<=0;
        text_d<=0;
        tcode<=0;
    end
    else if (lcd_inited)begin
        text_count<=(text_count[23:17]<68)?text_count+1:0;
        text_e<=text_count[16];
        text_rs<=1;
        text_rw<=0;
        text_d<=tcode;
        case(text_count[23:17])
        0:{text_rs,text_rw,tcode}<=6'b001000;
        1:{text_rs,text_rw,tcode}<=6'b000000;
        
        2:tcode<=row_A[127:124];
        3:tcode<=row_A[123:120];
        4:tcode<=row_A[119:116];
        5:tcode<=row_A[115:112];
        6:tcode<=row_A[111:108];
        7:tcode<=row_A[107:104];
        8:tcode<=row_A[103:100];
        9:tcode<=row_A[99:96];
        10:tcode<=row_A[95:92];
        11:tcode<=row_A[91:88];
        12:tcode<=row_A[87:84];
        13:tcode<=row_A[83:80];
        14:tcode<=row_A[79:76];
        15:tcode<=row_A[75:72];
        16:tcode<=row_A[71:68];
        17:tcode<=row_A[67:64];
        18:tcode<=row_A[63:60];
        19:tcode<=row_A[59:56];
        20:tcode<=row_A[55:52];
        21:tcode<=row_A[51:48];
        22:tcode<=row_A[47:44];
        23:tcode<=row_A[43:40];
        24:tcode<=row_A[39:36];
        25:tcode<=row_A[35:32];
        26:tcode<=row_A[31:28];
        27:tcode<=row_A[27:24];
        28:tcode<=row_A[23:20];
        29:tcode<=row_A[19:16];
        30:tcode<=row_A[15:12];
        31:tcode<=row_A[11:8];
        32:tcode<=row_A[7:4];
        33:tcode<=row_A[3:0];
        
        34:{text_rs,text_rw,tcode}<=6'b001100;
        35:{text_rs,text_rw,tcode}<=6'b000000;
        
        36:tcode<=row_B[127:124];
        37:tcode<=row_B[123:120];
        38:tcode<=row_B[119:116];
        39:tcode<=row_B[115:112];
        40:tcode<=row_B[111:108];
        41:tcode<=row_B[107:104];
        42:tcode<=row_B[103:100];
        43:tcode<=row_B[99:96];
        44:tcode<=row_B[95:92];
        45:tcode<=row_B[91:88];
        46:tcode<=row_B[87:84];
        47:tcode<=row_B[83:80];
        48:tcode<=row_B[79:76];
        49:tcode<=row_B[75:72];
        50:tcode<=row_B[71:68];
        51:tcode<=row_B[67:64];
        52:tcode<=row_B[63:60];
        53:tcode<=row_B[59:56];
        54:tcode<=row_B[55:52];
        55:tcode<=row_B[51:48];
        56:tcode<=row_B[47:44];
        57:tcode<=row_B[43:40];
        58:tcode<=row_B[39:36];
        59:tcode<=row_B[35:32];
        60:tcode<=row_B[31:28];
        61:tcode<=row_B[27:24];
        62:tcode<=row_B[23:20];
        63:tcode<=row_B[19:16];
        64:tcode<=row_B[15:12];
        65:tcode<=row_B[11:8];
        66:tcode<=row_B[7:4];
        67:tcode<=row_B[3:0];
        default:{text_rs,text_rw,tcode}<=6'h10;
        endcase
    end
 end


endmodule
