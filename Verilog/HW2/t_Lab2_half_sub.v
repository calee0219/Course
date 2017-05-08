module t_Lab2_half_sub;
	wire	gD, gB, dD, dB, bD, bB;
	reg	x, y;

	Lab2_half_sub_gatelevel	Hal_Sub_G(gD, gB, x, y);
	Lab2_half_sub_dataflow	Hal_Sub_D(dD, dB, x, y);
	Lab2_half_sub_behavior	Hal_Sub_B(bD, bB, x, y);

	initial
		begin
			x = 1'b0; y = 1'b0;
			#100 x = 1'b0; y = 1'b1;
			#100 x = 1'b1; y = 1'b0;
			#100 x = 1'b1; y = 1'b1;
		end
	initial #400 $finish;
endmodule
