`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:10:55 12/18/2016 
// Design Name: 
// Module Name:    Test04 
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
module Test04(
    input clk,
    input rst,
    input [1:0] min,
    input [1:0] sec,
    input sp,
    input inc,
    input dec,
    output [7:0] LED,
    output LCD_E,
    output LCD_RS,
    output LCD_RW,
    output [11:8] SF_D
    );
wire [127:0] row_A,row_B;
LCD lcd(.clk(clk),.rst(rst),.row_A(row_A),.row_B(row_B),.LCD_E(LCD_E),.LCD_RS(LCD_RS),.LCD_RW(LCD_RW),.LCD_D(SF_D));


reg prev_sp,prev_inc,prev_dec;
wire now_sp,now_inc,now_dec;
wire sp_pressed,inc_presssed,dec_pressed;
debounce d_sp(.clk(clk),.binput(sp),.boutput(now_sp));
debounce d_dec(.clk(clk),.binput(dec),.boutput(now_dec));
debounce d_inc(.clk(clk),.binput(inc),.boutput(now_inc));

assign sp_pressed=(now_sp==0 && prev_sp==1)?1:0;
assign inc_pressed=(now_inc==0 && prev_inc==1)?1:0;
assign dec_pressed=(now_dec==0 && prev_dec==1)?1:0;

always@(posedge clk or posedge rst)begin
    if(rst) prev_sp<=0;
    else prev_sp<=now_sp;
end
always@(posedge clk or posedge rst)begin
    if(rst) prev_dec<=0;
    else prev_dec<=now_dec;
end
always@(posedge clk or posedge rst)begin
    if(rst) prev_inc<=0;
    else prev_inc<=now_inc;
end


/////////////////////////
// parameter
///////////////////////////

parameter NUM=0;
parameter STA=1;
parameter PAU=2;
parameter SUC=3;

parameter CYC=50000000;

///////////////////////////
// reg and wire
///////////////////////////

reg [1:0] nState, cState;
reg [20:0] num;
reg [30:0] counter;
reg [20:0] org;

///////////////////////////
// CC
//////////////////////////

n2s n2s(
    .clk(clk),
    .num(num),
    .org(org),
    .cState(cState),
    .uRow(row_A),
    .dRow(row_B)
);
reg [30:0] LED_COUNT;
always@(posedge clk )begin
    if(cState==SUC) LED_COUNT<=(LED_COUNT==CYC)?0:LED_COUNT+1;
    else LED_COUNT<=0;
end
assign LED = (num==0 && (LED_COUNT>=CYC/2))?8'b11111111:0;
///////////////////////////
// FST
///////////////////////////

// cState
always@(posedge clk, posedge rst)
begin
    if(rst) cState <= NUM;
    else cState <= nState;
end

// nState
always@(*)
begin
    case(cState)
        NUM: begin
            if(sp_pressed) nState = STA;
            else nState = NUM;
        end
        STA: begin
            if(sp_pressed) nState = PAU;
            else if(num == 0) nState = SUC;
            else nState = STA;
        end
        PAU: begin
            if(sp_pressed) nState = STA;
            else nState = PAU;
        end
        SUC: nState = SUC;
        default: nState = NUM;
    endcase
end

/////////////////////////
// design
/////////////////////////

// counter
always@(posedge clk, posedge rst)
begin
    if(rst) counter <= 0;
    else begin
        if(cState == STA) begin
            counter <= (counter==CYC)? 0:counter+1;
        end else counter <= 0;
    end
end

// num
always@(posedge clk, posedge rst)
begin
    if(rst) begin
        num <= 0;
        org <= 0;
    end
    else begin
        case(cState)
            NUM: begin
                if(inc_pressed) begin
                    num <= num + min[1] * 600 + min[0] * 60 + sec[1] * 10 + sec[0];
                    org <= num;
                end else if(dec_pressed) begin
                    num <= num - min[1] * 600 - min[0] * 60 - sec[1] * 10 - sec[0];
                    org <= num;
                end else begin
                    num <= num;
                    org <= num;
                end
            end
            STA: begin
                if(counter == CYC) num <= num - 1;
                else num <= num;
            end
            PAU: num <= num;
            SUC: num <= num;
            default: num <= num;
        endcase
    end
end


endmodule
