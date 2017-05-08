module	Lab1_gatelevel(F, A, B, C, D);
	output	F;
	input	A, B, C, D;
	wire	w1, w2, w3, w4, w5, w6, w7;
	
	not		G1(w1, B);
	not		G2(w2, A);
	not		G3(w3, D);
	and		G4(w4, A, w1);
	and		G5(w5, w2, C);
	or		G6(w6, B, w3);
	or		G7(w7, w4, w5);
	and		G8(F, w7, w6);
endmodule