module	Lab1_gate_level_UDP(F, A, B, C, D);
	output	F;
	input	A, B, C, D;
	wire	w1, w2, w3;

	Lab1_UDP	M1(w1, A, B, C);
	not		G3(w2, D);
	or		G6(w3, B, w2);
	and		G8(F, w1, w3);
endmodule
