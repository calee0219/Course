module t_Lab2_ripple_borrow_4_bit_sub;
	wire	[3:0] Diff;
	wire	Bout;
	reg	[3:0] x, y;
	reg	Bin;

	Lab2_ripple_borrow_4_bit_sub Rip_Sub(Diff, Bout, x, y, Bin);

	initial
		begin
			x = 4'b1101; y = 4'b0101; Bin = 1'b0;
			#100 x = 4'b1101; y = 4'b0101; Bin = 1'b1;
			#100 x = 4'b0101; y = 4'b1101; Bin = 1'b0;
			#100 x = 4'b0101; y = 4'b1101; Bin = 1'b1;
			#100 x = 4'b0101; y = 4'b0101; Bin = 1'b0;
			#100 x = 4'b1101; y = 4'b1101; Bin = 1'b1;
		end
	initial #600 $finish;
endmodule
