module Online_test1(
  // Input signals
  clk,
  rst_n,
  in_valid,
  in,
  mode,
  // Output signals
  out_valid,
  out
);
//---------------------------------------------------------------------
//   INPUT AND OUTPUT DECLARATION                         
//---------------------------------------------------------------------

input clk;
input rst_n;
input [3:0] in;
input in_valid;
input [1:0] mode;
output reg [10:0] out;
output reg out_valid;

//---------------------------------------------------------------------
// PARAMETER DECLARATION
//---------------------------------------------------------------------

parameter INIT = 3'd0;
parameter INPUT = 3'd1;
parameter OUTPUT = 3'd2;
parameter MODE = 3'd3;
parameter OPER = 3'd4;
parameter WAIT = 3'd5;

//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION                             
//---------------------------------------------------------------------

reg [2:0] cstate, nstate;
reg [1:0] mod;
reg finish;
reg [4:0] n1, n2, n3, n4, n5, n6, n7, n8, n9;
reg [10:0] ans;
reg [4:0] max, min;
reg [3:0] cnt;
reg [3:0] getIn;

//---------------------------------------------------------------------
//   Finite-State Mechine                                          
//---------------------------------------------------------------------

// cstate
always@(posedge clk, negedge rst_n)
begin
	if(!rst_n) cstate <= INIT;
	else cstate <= nstate;
end
// nstate
always@(*)
begin
	case(cstate)
		INIT:
		begin
			if(in_valid) nstate = INPUT;
			else nstate = INIT;
		end
		INPUT:
		begin
		end
		OUTPUT:
		begin
			nstate = INIT;
		end
		MODE:
		begin
			nstate = OPER;
		end
		OPER:
		begin
			if(finish) nstate = OUTPUT;
			else nstate = OPER;
		end
		WAIT:
		begin
			if(in_valid) nstate = INPUT;
			else nstate = WAIT;
		end
		default:
		begin
			nstate = INIT;
		end
	endcase
end

//---------------------------------------------------------------------
//   Design Description                                          
//---------------------------------------------------------------------

// getIn
always@(
// max, min
always@(posedge clk, negedge rst_n)
begin
	if(!rst_n)
	begin
		max <= 0;
		min <= 0;
	end
	else
	case(cstate)
		INIT:
		begin
			max <= 0;
			min <= 0;
		end
		OPER:
		if(mod != 2)
		begin
			case(cnt)
				0:
				begin
					max <= n1;
					min <= n1;
				end
				1:
				begin
					if(max < n2) max <= n2;
					else max <= max;
					if(min > n2) min <= n2;
					else min <= min;
				end
				2:
				begin
					if(max < n3) max <= n3;
					else max <= max;
					if(min > n3) min <= n3;
					else min <= min;
				end
				3:
				begin
					if(max < n4) max <= n4;
					else max <= max;
					if(min > n4) min <= n4;
					else min <= min;
				end
				4:
				begin
					if(max < n5) max <= n5;
					else max <= max;
					if(min > n5) min <= n5;
					else min <= min;
				end
				5:
				begin
					if(max < n6) max <= n6;
					else max <= max;
					if(min > n6) min <= n6;
					else min <= min;
				end
				6:
				begin
					if(max < n7) max <= n7;
					else max <= max;
					if(min > n7) min <= n7;
					else min <= min;
				end
				7:
				begin
					if(max < n8) max <= n8;
					else max <= max;
					if(min > n8) min <= n8;
					else min <= min;
				end
				8:
				begin
					if(max < n9) max <= n9;
					else max <= max;
					if(min > n9) min <= n9;
					else min <= min;
				end
				default:
				begin
					max <= max;
					min <= min;
				end
			endcase
		end
		default:
		begin
			max <= max; min <= min;
		end
	endcase
end

// ans, finish
always@(posedge clk, negedge rst_n)
begin
	if(!rst_n)
	begin
		ans <= 0;
		finish <= 0;
	end
	else
	case(cstate)
		INIT:
		begin
			ans <= 0;
			finish <= 0;
		end
		INPUT:
		begin
			ans <= ans+in;
		end
		OPER:
		begin
			case(mod)
				0:
				begin
					if(cnt == 9)
					begin
						ans <= max;
						finish <= 1;
					end
					else
					begin
						ans <= ans; finish <= finish;
					end
				end
				1:
				begin
					if(cnt == 9)
					begin
						ans <= min;
						finish <= 1;
					end
					else
					begin
						ans <= ans; finish <= finish;
					end
				end
				2:
				begin
					finish <= 1;
				end
				default:
				begin
					finish <= finish;
				end
			endcase
		end
		default:
		begin
			ans <= ans; finish <= finish;
		end
	endcase
end
// out, out_valid
always@(posedge clk, negedge rst_n)
begin
	if(!rst_n)
	begin
		out <= 0;
		out_valid <= 0;
	end
	else
	case(nstate)
		INIT:
		begin
			out <= 0;
			out_valid <= 0;
		end
		OUTPUT:
		begin
			out <= ans;
			out_valid <= 1;
		end
		default:
		begin
			out <= out; out_valid <= out_valid;
		end
	endcase
end
// n, mod
always@(posedge clk, negedge rst_n)
begin
	if(!rst_n)
	begin
		n1 <= 0; n2 <= 0; n3 <= 0; n4 <= 0; n5 <= 0; n6 <= 0; n7 <= 0; n8 <= 0; n9 <= 0;
		mod <= 0;
	end
	else
	case(nstate)
		INIT:
		begin
			n1 <= 0; n2 <= 0; n3 <= 0; n4 <= 0; n5 <= 0; n6 <= 0; n7 <= 0; n8 <= 0; n9 <= 0;
			mod <= 0;
		end
		INPUT:
		begin
			case(in)
				1: n1 <= n1+1;
				2: n2 <= n2+1;
				3: n3 <= n3+1;
				4: n4 <= n4+1;
				5: n5 <= n5+1;
				6: n6 <= n6+1;
				7: n7 <= n7+1;
				8: n8 <= n8+1;
				9: n9 <= n9+1;
				default:
				begin
					n1 <= n1; n2 <= n2; n3 <= n3; n4 <= n4; n5 <= n5; n6 <= n6; n7 <= n7; n8 <= n8; n9 <= n9;
				end
			endcase
		end
		MODE:
		begin
			mod <= mode;
		end
		default:
		begin
			n1 <= n1; n2 <= n2; n3 <= n3; n4 <= n4; n5 <= n5; n6 <= n6; n7 <= n7; n8 <= n8; n9 <= n9;
		end
	endcase
end

endmodule
