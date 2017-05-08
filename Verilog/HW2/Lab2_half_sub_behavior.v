module Lab2_half_sub_behavior(output reg D, B, input x, y);

	always @(x, y) begin
		if(x == 1 && y == 0) begin D = 1; B = 0; end
		else if(x == 0 && y == 1) begin D = 1; B = 1; end
		else begin D = 0; B = 0; end
	end
endmodule
