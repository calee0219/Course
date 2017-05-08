module IMPOR(
	output reg [2:0] out,
	output reg out_valid,
	output reg ready,
	input  [2:0] in,
	input  [2:0] mode,
	input  in_valid,
	input  clk,
	input  rst_n
);

reg sta;
reg [2:0] sta10, sta11, sta12, sta13, sta14, sta15, sta16, sta17, sta18;
wire [2:0] sta20, sta21, sta22, sta23, sta24, sta25, sta26, sta27, sta28;
reg [20:0] cnt1, cnt2;
reg rst;

assign sta20 = sta10;
assign sta21 = sta11;
assign sta22 = sta12;
assign sta23 = sta13;
assign sta24 = sta14;
assign sta25 = sta15;
assign sta26 = sta16;
assign sta27 = sta17;
assign sta28 = sta18;

// rst, ready
always@(posedge clk or negedge rst_n) begin
	if(rst_n == 0) begin
		rst <= 0;
		ready <= 1;
	end else if(rst == 1) begin
		rst <= 0;
		ready <= 1;
	end else if(cnt2 == 10) rst <= 1;
	else;
end // end of always

// cnt1, cnt2
always@(posedge clk or negedge rst_n) begin
	if(rst_n == 0) begin cnt1 <= 0; cnt2 <= 0; end
	else if(rst == 1) begin cnt1 <= 0; cnt2 <= 0; end
	else if(in_valid == 1) cnt1 <= cnt1+1;
	else if(sta == 1 && in_valid == 0) cnt2 <= cnt2+1;
	else;
end // end of always

// sta
always@(posedge clk or negedge rst_n) begin
	if(rst_n == 0) begin
		sta <= 0;
		sta10 <= 0; sta11 <= 0; sta12 <= 0; sta13 <= 0; sta14 <= 0; sta15 <= 0; sta16 <= 0; sta17 <= 0; sta18 <= 0;
	end else if(rst == 1) begin
		sta <= 0;
		sta10 <= 0; sta11 <= 0; sta12 <= 0; sta13 <= 0; sta14 <= 0; sta15 <= 0; sta16 <= 0; sta17 <= 0; sta18 <= 0;
	end else if(in_valid == 1) begin
		sta <= 1;
		case(cnt1)
			0: sta10 <= in;
			1: sta11 <= in;
			2: sta12 <= in;
			3: sta13 <= in;
			4: sta14 <= in;
			5: sta15 <= in;
			6: sta16 <= in;
			7: sta17 <= in;
			8: sta18 <= in;
			default: begin
				case(mode)
					1: begin
						sta10 <= sta22;
						sta11 <= sta21;
						sta12 <= sta20;
						sta13 <= sta25;
						sta14 <= sta24;
						sta15 <= sta23;
						sta16 <= sta28;
						sta17 <= sta27;
						sta18 <= sta26;
					end
					2: begin
						sta10 <= sta26;
						sta11 <= sta27;
						sta12 <= sta28;
						sta13 <= sta23;
						sta14 <= sta24;
						sta15 <= sta25;
						sta16 <= sta20;
						sta17 <= sta21;
						sta18 <= sta22;
					end
					3: begin
						sta10 <= sta22;
						sta11 <= sta25;
						sta12 <= sta28;
						sta13 <= sta21;
						sta14 <= sta24;
						sta15 <= sta27;
						sta16 <= sta20;
						sta17 <= sta23;
						sta18 <= sta26;
					end
					4: begin
						sta10 <= sta26;
						sta11 <= sta23;
						sta12 <= sta20;
						sta13 <= sta27;
						sta14 <= sta24;
						sta15 <= sta21;
						sta16 <= sta28;
						sta17 <= sta25;
						sta18 <= sta22;
					end
					5: begin
						if(sta20 == 7) sta10 <= sta20;
						else sta10 <= sta20+1;
						sta11 <= sta21;
						sta12 <= sta22;
						if(sta23 == 7) sta13 <= sta23;
						else sta13 <= sta23+1;
						sta14 <= sta24;
						sta15 <= sta25;
						if(sta26 == 7) sta16 <= sta26;
						else sta16 <= sta26+1;
						sta17 <= sta27;
						sta18 <= sta28;
					end
					6: begin
						sta10 <= sta20;
						if(sta21 == 7) sta11 <= sta21;
						else sta11 <= sta21+1;
						sta12 <= sta22;
						sta13 <= sta23;
						if(sta24 == 7) sta14 <= sta24;
						else sta14 <= sta24+1;
						sta15 <= sta25;
						sta16 <= sta26;
						if(sta27 == 7) sta17 <= sta27;
						else sta17 <= sta27+1;
						sta18 <= sta28;
					end
					7: begin
						sta10 <= sta20;
						sta11 <= sta21;
						if(sta22 == 7) sta12 <= sta22;
						else sta12 <= sta22+1;
						sta13 <= sta23;
						sta14 <= sta24;
						if(sta25 == 7) sta15 <= sta25;
						else sta15 <= sta25+1;
						sta16 <= sta26;
						sta17 <= sta27;
						if(sta28 == 7) sta18 <= sta28;
						else sta18 <= sta28+1;
					end
					default: begin
						sta10 <= sta20;
						sta11 <= sta21;
						sta12 <= sta22;
						sta13 <= sta23;
						sta14 <= sta24;
						sta15 <= sta25;
						sta16 <= sta26;
						sta17 <= sta27;
						sta18 <= sta28;
					end
				endcase
			end
		endcase
	end else;
end // end of always

// out, out_valid
always@(posedge clk or negedge rst_n) begin
	if(rst_n == 0) begin out <= 0; out_valid <= 0; end
	else if(rst == 1) begin out <= 0; out_valid <= 0; end
	else if(sta == 1 && in_valid == 0) begin
		case(cnt2)
			1: begin
				out_valid <= 1;
				out <= sta10;
			end
			2: begin
				out_valid <= 1;
				out <= sta11;
			end
			3: begin
				out_valid <= 1;
				out <= sta12;
			end
			4: begin
				out_valid <= 1;
				out <= sta13;
			end
			5: begin
				out_valid <= 1;
				out <= sta14;
			end
			6: begin
				out_valid <= 1;
				out <= sta15;
			end
			7: begin
				out_valid <= 1;
				out <= sta16;
			end
			8: begin
				out_valid <= 1;
				out <= sta17;
			end
			9: begin
				out_valid <= 1;
				out <= sta18;
			end
			default: begin
				out_valid <= 0;
			end
		endcase
	end else;
end // end of always

endmodule
