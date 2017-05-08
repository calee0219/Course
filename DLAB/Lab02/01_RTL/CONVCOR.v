module convolution(outr,outi,a,b);
    input [15:0] a, b;
    output [17:0] outr, outi;

    wire signed [7:0] a_rea, a_ima, b_rea, b_ima;

    assign a_rea = a[15:8]; assign a_ima = a[7:0];
    assign b_rea = b[15:8]; assign b_ima = b[7:0];

    assign outr = a_rea*b_rea - a_ima*b_ima;
    assign outi = a_rea*b_ima + a_ima*b_rea;
endmodule

module correlation(outr,outi,a,b);
    input [15:0] a, b;
    output signed [17:0] outr, outi;

    wire signed [7:0] a_rea, a_ima, b_rea, b_ima;

    assign a_rea = a[15:8]; assign a_ima = a[7:0];
    assign b_rea = b[15:8]; assign b_ima = b[7:0];

    assign outr = a_rea*b_rea + a_ima*b_ima;
    assign outi = a_ima*b_rea - a_rea*b_ima;
endmodule

module CONVCOR(
	clk,
	rst_n,
	in_valid,
	in_a,
	in_b,
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
input 	[15:0]     in_a;
input 	[15:0]     in_b;
input 	           in_mode;
output  reg        out_valid;
output  reg [35:0] out;


//----------------------------------
// reg and wire declaration
//----------------------------------
 
reg signed [15:0] a0, a1, a2;
reg signed [15:0] b0, b1, b2;
reg sta;
reg [1:0] cnt;
reg [5:0] start;
reg rst;
wire signed [17:0] out11r, out21r, out22r, out31r, out32r, out33r, out41r, out42r, out51r;
wire signed [17:0] out11i, out21i, out22i, out31i, out32i, out33i, out41i, out42i, out51i;
wire signed [17:0] crrout1r, crrout2r, crrout3r, crrout1i, crrout2i, crrout3i;
 
//----------------------------------
//
//         My design
//
//----------------------------------

convolution cnv11(out11r,out11i,a0,b0);
convolution cnv21(out21r,out21i,a0,b1);
convolution cnv22(out22r,out22i,a1,b0);
convolution cnv31(out31r,out31i,a0,b2);
convolution cnv32(out32r,out32i,a1,b1);
convolution cnv33(out33r,out33i,a2,b0);
convolution cnv41(out41r,out41i,a1,b2);
convolution cnv42(out42r,out42i,a2,b1);
convolution cnv51(out51r,out51i,a2,b2);

correlation crr1(crrout1r,crrout1i,a0,b0);
correlation crr2(crrout2r,crrout2i,a1,b1);
correlation crr3(crrout3r,crrout3i,a2,b2);

always@(negedge clk) begin
    if(in_mode) sta = 1;
    if(rst_n == 0 || rst) begin
        out_valid = 0;
        out = 0;
        a0 = 0; a1 = 0; a2 = 0;
        b0 = 0; b1 = 0; b2 = 0;
        sta = 0;
        cnt = 0;
        start = 0;
        rst = 0;
    end
    if(in_valid) begin
        cnt = cnt+1;
        case(cnt)
            1: begin a0 = in_a; b0 = in_b; end
            2: begin a1 = in_a; b1 = in_b; end
            3: begin a2 = in_a; b2 = in_b; end
        endcase
    end
    if(cnt >= 3) begin
        start = start+1;
        case(sta)
            0: begin
	        case(start)
                    2: begin
	                out_valid = 1;
	                out[35:18] = out11r;
	                out[17:0] = out11i;
	            end
	            3: begin
	                out_valid = 1;
	                out[35:18] = out21r+out22r;
	                out[17:0] = out21i+out22i;
	            end
	            4: begin
	                out_valid = 1;
	                out[35:18] = out31r+out32r+out33r;
	                out[17:0] = out31i+out32i+out33i;
	            end
	            5: begin
	                out_valid = 1;
	                out[35:18] = out41r+out42r;
	                out[17:0] = out41i+out42i;
	            end
	            6: begin
	                out_valid = 1;
	                out[35:18] = out51r;
	                out[17:0] = out51i;
	            end
                    7: begin
                        out_valid = 0;
                        rst = 1;
                    end
                endcase
            end
            1: begin
                if(start == 2) begin
                    out[35:18] = crrout1r+crrout2r+crrout3r;
                    out[17:0] = crrout1i+crrout2i+crrout3i;
                    out_valid = 1;
                end
                if(start == 3) begin
                    out_valid = 0;
                    rst = 1;
                end
            end
	endcase
    end
end

endmodule
