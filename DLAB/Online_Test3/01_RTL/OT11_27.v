module OT11_27(
	clk,
	rst_n,
	in,
	bomb,
	in_valid1,
	hit,
	in_valid2,

	out_valid,
	out
);

// in,out put
input clk;
input rst_n;
input [7:0] in;
input [7:0] bomb;
input in_valid1;
input [5:0] hit;
input in_valid2;
output reg out_valid;
output reg [6:0] out;

// parameter
parameter IDLE=0, INPUT=1, OPER=2, OUTPUT=3;

// wire, reg
reg [1:0] cState, nState;
reg [5:0] h [9:0];
reg [7:0] b [7:0];
reg [7:0] r [7:0];
wire [7:0] blockNum;
reg [7:0] initBlockNum;
reg [3:0] cnt;

reg [3:0] i;

// conbinational circlk
assign blockNum = b[0][0]+b[0][1]+b[0][2]+b[0][3]+b[0][4]+b[0][5]+b[0][6]+b[0][7]+
                  b[1][0]+b[1][1]+b[1][2]+b[1][3]+b[1][4]+b[1][5]+b[1][6]+b[1][7]+
		  b[2][0]+b[2][1]+b[2][2]+b[2][3]+b[2][4]+b[2][5]+b[2][6]+b[2][7]+
		  b[3][0]+b[3][1]+b[3][2]+b[3][3]+b[3][4]+b[3][5]+b[3][6]+b[3][7]+
		  b[4][0]+b[4][1]+b[4][2]+b[4][3]+b[4][4]+b[4][5]+b[4][6]+b[4][7]+
		  b[5][0]+b[5][1]+b[5][2]+b[5][3]+b[5][4]+b[5][5]+b[5][6]+b[5][7]+
		  b[6][0]+b[6][1]+b[6][2]+b[6][3]+b[6][4]+b[6][5]+b[6][6]+b[6][7]+
		  b[7][0]+b[7][1]+b[7][2]+b[7][3]+b[7][4]+b[7][5]+b[7][6]+b[7][7];

// finite state machine

always@(posedge clk, negedge rst_n)
begin
	if(!rst_n) cState <= IDLE;
	else cState <= nState;
end

always@(*)
begin
	case(cState)
		IDLE: begin
			if(in_valid1) nState = INPUT;
			else nState = IDLE;
		end
		INPUT: begin
			if(!in_valid2) nState = OPER;
			else nState = INPUT;
		end
		OPER: begin
			if(cnt == 9) nState = OUTPUT;
			else nState = OPER;
		end
		OUTPUT: nState = IDLE;
		default: nState = IDLE;
	endcase
end

// sequencial circket

// cnt
always@(posedge clk, negedge rst_n)
begin
	if(!rst_n) cnt <= 0;
	else begin
		case(cState)
			IDLE: begin
				if(nState == INPUT && in_valid1) cnt <= 1;
				else cnt <= 0;
			end
			INPUT: begin
				if(in_valid2) cnt <= cnt+1;
				else cnt <= 0;
			end
			OPER: cnt <= cnt+1;
			OUTPUT: cnt <= cnt;
			default: cnt <= cnt;
		endcase
	end
end

// initBlockNum
always@(posedge clk, negedge rst_n)
begin
	if(!rst_n) initBlockNum <= 0;
	else begin
		case(cState)
			IDLE: initBlockNum <= 0;
			INPUT: initBlockNum <= initBlockNum;
			OPER: begin
				if(!cnt) initBlockNum <= blockNum;
				else initBlockNum <= initBlockNum;
			end
			OUTPUT: initBlockNum <= initBlockNum;
			default: initBlockNum <= initBlockNum;
		endcase
	end
end

// h
always@(posedge clk, negedge rst_n)
begin
	if(!rst_n) for(i=0;i<10;i=i+1) h[i] <= 0;
	else begin
		case(cState)
			IDLE: begin
				for(i=1;i<10;i=i+1) h[i] <= 0;
				if(nState == INPUT && in_valid2) h[0] <= hit;
				else h[0] <= 0;
			end
			INPUT: h[cnt] <= hit;
			OPER: for(i=0;i<10;i=i+1) h[i] <= h[i];
			OUTPUT: for(i=0;i<10;i=i+1) h[i] <= h[i];
			default: for(i=0;i<10;i=i+1) h[i] <= h[i];
		endcase
	end
end

// b
always@(posedge clk, negedge rst_n)
begin
	if(!rst_n) for(i=0;i<8;i=i+1) b[i] <= 0;
	else begin
		case(cState)
			IDLE: begin
				for(i=1;i<8;i=i+1) b[i] <= 0;
				if(nState == INPUT && in_valid1) b[0] <= in;
				else b[0] <= 0;
			end
			INPUT: begin
				if(in_valid1) b[cnt] <= in;
				else for(i=0;i<8;i=i+1) b[i] <= b[i];
			end
			OPER: begin
				b[h[cnt]/8][h[cnt]%8] <= 0;
				if(r[h[cnt]/8][h[cnt]%8]) begin
					if(h[cnt]/8+1 < 8 && h[cnt]/8+1 >= 0 && h[cnt]%8 < 8 && h[cnt]%8 >= 0) b[h[cnt]/8+1][h[cnt]%8] <= 0; else b[h[cnt]/8+1][h[cnt]%8] <= b[h[cnt]/8+1][h[cnt]%8];
					if(h[cnt]/8-1 < 8 && h[cnt]/8-1 >= 0 && h[cnt]%8 < 8 && h[cnt]%8 >= 0) b[h[cnt]/8-1][h[cnt]%8] <= 0; else b[h[cnt]/8-1][h[cnt]%8] <= b[h[cnt]/8-1][h[cnt]%8];
					if(h[cnt]/8 < 8 && h[cnt]/8 >= 0 && h[cnt]%8+1 < 8 && h[cnt]%8+1 >= 0) b[h[cnt]/8][h[cnt]%8+1] <= 0; else b[h[cnt]/8][h[cnt]%8+1] <= b[h[cnt]/8][h[cnt]%8+1];
					if(h[cnt]/8 < 8 && h[cnt]/8 >= 0 && h[cnt]%8-1 < 8 && h[cnt]%8-1 >= 0) b[h[cnt]/8][h[cnt]%8-1] <= 0; else b[h[cnt]/8][h[cnt]%8-1] <= b[h[cnt]/8][h[cnt]%8-1];
					if(h[cnt]/8+1 < 8 && h[cnt]/8+1 >= 0 && h[cnt]%8-1 < 8 && h[cnt]%8-1 >= 0) b[h[cnt]/8+1][h[cnt]%8-1] <= 0; else b[h[cnt]/8+1][h[cnt]%8-1] <= b[h[cnt]/8+1][h[cnt]%8-1];
					if(h[cnt]/8-1 < 8 && h[cnt]/8-1 >= 0 && h[cnt]%8-1 < 8 && h[cnt]%8-1 >= 0) b[h[cnt]/8-1][h[cnt]%8-1] <= 0; else b[h[cnt]/8-1][h[cnt]%8-1] <= b[h[cnt]/8-1][h[cnt]%8-1];
					if(h[cnt]/8+1 < 8 && h[cnt]/8+1 >= 0 && h[cnt]%8+1 < 8 && h[cnt]%8+1 >= 0) b[h[cnt]/8+1][h[cnt]%8+1] <= 0; else b[h[cnt]/8+1][h[cnt]%8+1] <= b[h[cnt]/8+1][h[cnt]%8+1];
					if(h[cnt]/8-1 < 8 && h[cnt]/8-1 >= 0 && h[cnt]%8+1 < 8 && h[cnt]%8+1 >= 0) b[h[cnt]/8-1][h[cnt]%8+1] <= 0; else b[h[cnt]/8-1][h[cnt]%8+1] <= b[h[cnt]/8-1][h[cnt]%8+1];
				end
			end
			OUTPUT: for(i=0;i<8;i=i+1) b[i] <= b[i];
			default: for(i=0;i<8;i=i+1) b[i] <= b[i];
		endcase
	end
end

// r
always@(posedge clk, negedge rst_n)
begin
	if(!rst_n) for(i=0;i<8;i=i+1) r[i] <= 0;
	else begin
		case(cState)
			IDLE: begin
				for(i=1;i<8;i=i+1) r[i] <= 0;
				if(nState == INPUT && in_valid1) r[0] <= bomb;
				else r[0] <= 0;
			end
			INPUT: begin
				if(in_valid1) r[cnt] <= bomb;
				else for(i=0;i<8;i=i+1) r[i] <= r[i];
			end
			OPER: begin
				r[h[cnt]/8][h[cnt]%8] <= 0;
				if(r[h[cnt]/8][h[cnt]%8]) begin
					if(h[cnt]/8+1 < 8 && h[cnt]/8+1 >= 0 && h[cnt]%8 < 8 && h[cnt]%8 >= 0) r[h[cnt]/8+1][h[cnt]%8] <= 0; else r[h[cnt]/8+1][h[cnt]%8] <= r[h[cnt]/8+1][h[cnt]%8];
					if(h[cnt]/8-1 < 8 && h[cnt]/8-1 >= 0 && h[cnt]%8 < 8 && h[cnt]%8 >= 0) r[h[cnt]/8-1][h[cnt]%8] <= 0; else r[h[cnt]/8-1][h[cnt]%8] <= r[h[cnt]/8-1][h[cnt]%8];
					if(h[cnt]/8 < 8 && h[cnt]/8 >= 0 && h[cnt]%8+1 < 8 && h[cnt]%8+1 >= 0) r[h[cnt]/8][h[cnt]%8+1] <= 0; else r[h[cnt]/8][h[cnt]%8+1] <= r[h[cnt]/8][h[cnt]%8+1];
					if(h[cnt]/8 < 8 && h[cnt]/8 >= 0 && h[cnt]%8-1 < 8 && h[cnt]%8-1 >= 0) r[h[cnt]/8][h[cnt]%8-1] <= 0; else r[h[cnt]/8][h[cnt]%8-1] <= r[h[cnt]/8][h[cnt]%8-1];
					if(h[cnt]/8+1 < 8 && h[cnt]/8+1 >= 0 && h[cnt]%8-1 < 8 && h[cnt]%8-1 >= 0) r[h[cnt]/8+1][h[cnt]%8-1] <= 0; else r[h[cnt]/8+1][h[cnt]%8-1] <= r[h[cnt]/8+1][h[cnt]%8-1];
					if(h[cnt]/8-1 < 8 && h[cnt]/8-1 >= 0 && h[cnt]%8-1 < 8 && h[cnt]%8-1 >= 0) r[h[cnt]/8-1][h[cnt]%8-1] <= 0; else r[h[cnt]/8-1][h[cnt]%8-1] <= r[h[cnt]/8-1][h[cnt]%8-1];
					if(h[cnt]/8+1 < 8 && h[cnt]/8+1 >= 0 && h[cnt]%8+1 < 8 && h[cnt]%8+1 >= 0) r[h[cnt]/8+1][h[cnt]%8+1] <= 0; else r[h[cnt]/8+1][h[cnt]%8+1] <= r[h[cnt]/8+1][h[cnt]%8+1];
					if(h[cnt]/8-1 < 8 && h[cnt]/8-1 >= 0 && h[cnt]%8+1 < 8 && h[cnt]%8+1 >= 0) r[h[cnt]/8-1][h[cnt]%8+1] <= 0; else r[h[cnt]/8-1][h[cnt]%8+1] <= r[h[cnt]/8-1][h[cnt]%8+1];
				end
			end
			OUTPUT: for(i=0;i<8;i=i+1) r[i] <= r[i];
			default: for(i=0;i<8;i=i+1) r[i] <= r[i];
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
			INPUT: out_valid <= 0;
			OPER: out_valid <= 0;
			OUTPUT: out_valid <= 1;
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
			OPER: out <= out;
			OUTPUT: out <= initBlockNum-blockNum;
			default: out <= out;
		endcase
	end
end
endmodule
