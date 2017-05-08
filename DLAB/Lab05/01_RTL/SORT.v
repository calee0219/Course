module SORT(
  // Input signals
  clk,
  rst_n,
  in_valid1,
  in_valid2,
  in,
  mode,
  op,
  // Output signals
  out_valid,
  out
);
//---------------------------------------------------------------------
//   INPUT AND OUTPUT DECLARATION                         
//---------------------------------------------------------------------

input clk;
input rst_n;
input mode;
input in_valid1, in_valid2;
input [4:0] in;
input [1:0] op;
output reg out_valid;
output reg [4:0] out;

//---------------------------------------------------------------------
// PARAMETER DECLARATION
//---------------------------------------------------------------------

parameter IDLE=0;
parameter INPUT=1;
parameter OUTPUT=2;

//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION                             
//---------------------------------------------------------------------

integer i;

reg mo;
reg [1:0] cState, nState;
reg [3:0] count;
reg [4:0] queue [0:9];
reg [3:0] back;
//reg [3:0] front, back;

wire [4:0] l1;
wire [4:0] l2 [0:2];
wire [4:0] l3 [0:3];
wire [4:0] l4 [0:5];
wire [3:0] p1;
wire [3:0] p2 [0:2];
wire [3:0] p3 [0:3];
wire [3:0] p4 [0:5];

//---------------------------------------------------------------------
//   Combinational Circuits
//---------------------------------------------------------------------

assign l1 = l2[0] > l2[1] ? l2[0] : l2[1];
assign p1 = l2[0] > l2[1] ? p2[0] : p2[1];
assign l2[0] = l3[0] > l3[1] ? l3[0] : l3[1];
assign p2[0] = l3[0] > l3[1] ? p3[0] : p3[1];
assign l2[1] = l3[2];
assign p2[1] = p3[2];
assign l3[0] = l4[0] > l4[1] ? l4[0] : l4[1];
assign p3[0] = l4[0] > l4[1] ? p4[0] : p4[1];
assign l3[1] = l4[2] > l4[3] ? l4[2] : l4[3];
assign p3[1] = l4[2] > l4[3] ? p4[2] : p4[3];
assign l3[2] = l4[4];
assign p3[2] = p4[4];
assign l4[0] = queue[0] > queue[1] ? queue[0] : queue[1];
assign p4[0] = queue[0] > queue[1] ? 0 : 1;
assign l4[1] = queue[2] > queue[3] ? queue[2] : queue[3];
assign p4[1] = queue[2] > queue[3] ? 2 : 3;
assign l4[2] = queue[4] > queue[5] ? queue[4] : queue[5];
assign p4[2] = queue[4] > queue[5] ? 4 : 5;
assign l4[3] = queue[6] > queue[7] ? queue[6] : queue[7];
assign p4[3] = queue[6] > queue[7] ? 6 : 7;
assign l4[4] = queue[8] > queue[9] ? queue[8] : queue[9];
assign p4[4] = queue[8] > queue[9] ? 8 : 9;

//---------------------------------------------------------------------
//   Finite-State Mechine                                          
//---------------------------------------------------------------------

// cState
always@(posedge clk, negedge rst_n)
begin
    if(!rst_n) cState <= IDLE;
    else cState <= nState;
end

// nState
always@(*)
begin
    case(cState)
        IDLE: if(in_valid2) nState = INPUT;
            else nState = INPUT;
        INPUT: if(in_valid1 && op == 2) nState = OUTPUT;
            else nState = INPUT;
        OUTPUT: if(count == 10) nState = IDLE;
            else nState = OUTPUT;
        default: nState = IDLE;
    endcase
end

//---------------------------------------------------------------------
//   Design Description                                          
//---------------------------------------------------------------------

// mo
always@(posedge clk, negedge rst_n)
begin
    if(!rst_n) mo <= 0;
    else begin
        if(in_valid2) mo <= mode;
        else mo <= mo;
    end
end

// back
always@(posedge clk, negedge rst_n)
begin
    if(!rst_n) back <= 0;
    else begin
        case(cState)
            IDLE: back <= 0;
            INPUT: begin
                if(in_valid1) begin
                    if(op) begin                    // queue mode
                        back <= back+1;
                    end else begin                  // stack mode
                        if(back != 0) back <= back-1;
                        else back <= 0;
                    end
                end
            end
            OUTPUT: back <= back;
            default: back <= 0;
        endcase
    end
end

// queue
always@(posedge clk, negedge rst_n)
begin
    if(!rst_n) for(i = 0; i < 10; i=i+1) queue[i] <= 0;
    else begin
        case(cState)
            IDLE: for(i = 0; i < 10; i=i+1) queue[i] <= 0;
            INPUT: begin
                if(in_valid1) begin
                    if(mo) begin                    // queue mode
                        if(op == 1) queue[back] <= in;
                        else if(op == 0) begin
                            for(i = 0; i < 9; i=i+1) queue[i] <= queue[i+1];
                            queue[9] <= 0;
                        end else for(i = 0; i < 10; i=i+1) queue[i] <= queue[i];
                    end else begin                  // stack mode
                        if(op == 1) queue[back] <= in;
                        else if(op == 0) queue[back-1] <= 0;
                        else for(i = 0; i < 10; i=i+1) queue[i] <= queue[i];
                    end
                end else for(i = 0; i < 10; i=i+1) queue[i] <= queue[i];
            end
            OUTPUT: queue[p1] <= 0;
            default: for(i = 0; i < 10; i=i+1) queue[i] <= queue[i];
        endcase
    end
end

// count
always@(posedge clk, negedge rst_n)
begin
    if(!rst_n) count <= 0;
    else begin
        case(cState)
            IDLE: count <= 0;
            INPUT: count <= count;
            OUTPUT: begin
                count <= count + 1;
            end
            default: count <= count;
        endcase
    end
end

// out_valid
always@(posedge clk, negedge rst_n)
begin
    if(!rst_n) out_valid <= 0;
    else begin
        case(cState)
            IDLE: out_valid <= 0;
            INPUT: out_valid <= out_valid;
            OUTPUT: begin
                if(count == 10) out_valid <= 0;
                else out_valid <= 1;
            end
            default: out_valid <= out_valid;
        endcase
    end
end

// out
always@(posedge clk, negedge rst_n)
begin
    if(!rst_n) out <= 0;
    else begin
        case(cState)
            IDLE: out <= 0;
            INPUT: out <= out;
            OUTPUT: begin
                out <= l1;
            end
            default: out <= out;
        endcase
    end
end

endmodule
