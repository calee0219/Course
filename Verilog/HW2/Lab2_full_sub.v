module Lab2_full_sub(output D, B, input x, y, z);
	wire	b1, b2, d;

	Lab2_half_sub_gatelevel	S1(d, b1, x, y);
	Lab2_half_sub_gatelevel	S2(D, b2, d, z);
	or			OR(B, b1, b2);
endmodule
