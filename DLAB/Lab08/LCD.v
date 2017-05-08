module LCD(
    input clk,
    input rst,
    input [127:0] upRow,
    input [127:0] doRow,
    output e,
    output rs,
    output rw,
    output [3:0] sf
    );

	reg [23:0] count = 0;
	reg refresh;
	reg [5:0] Code;

assign {e, rs, rw, sf} = {refresh, Code};

// count
always@(posedge clk, posedge rst)
begin
		if(rst) count <= count;
		else count <= (count[23:17] < 78) ? count+1 : 0;
end

// LCD	
always@(posedge clk, posedge rst)
begin
		if(rst) Code <= 6'h10;
		else begin
				case(count[23:17])
						0 :	Code <= 6'h03; // power-on
						1 :	Code <= 6'h03;
						2 :	Code <= 6'h03;
						3 :	Code <= 6'h02;
						
						4 : Code <= 6'h02; // function set
						5 : Code <= 6'h08;
						
						6 : Code <= 6'h00; // entry
						7 : Code <= 6'h06;
						
						8 : Code <= 6'h00; // display on/off
						9 : Code <= 6'h0C;
						
						10: Code <= 6'h00; // clear display
						11: Code <= 6'h01;
						
						12: Code <= {2'b10,upRow[127:124]};
						13: Code <= {2'b10,upRow[123:120]};
						14: Code <= {2'b10,upRow[119:116]};
						15: Code <= {2'b10,upRow[115:112]};
						16: Code <= {2'b10,upRow[111:108]};
						17: Code <= {2'b10,upRow[107:104]};
						18: Code <= {2'b10,upRow[103:100]};
						19: Code <= {2'b10,upRow[99 :96 ]};
						20: Code <= {2'b10,upRow[95 :92 ]};
						21: Code <= {2'b10,upRow[91 :88 ]};
						22: Code <= {2'b10,upRow[87 :84 ]};
						23: Code <= {2'b10,upRow[83 :80 ]};
						24: Code <= {2'b10,upRow[79 :76 ]};
						25: Code <= {2'b10,upRow[75 :72 ]};
						26: Code <= {2'b10,upRow[71 :68 ]};
						27: Code <= {2'b10,upRow[67 :64 ]};
						28: Code <= {2'b10,upRow[63 :60 ]};
						29: Code <= {2'b10,upRow[59 :56 ]};
						30: Code <= {2'b10,upRow[55 :52 ]};
						31: Code <= {2'b10,upRow[51 :48 ]};
						32: Code <= {2'b10,upRow[47 :44 ]};
						33: Code <= {2'b10,upRow[43 :40 ]};
						34: Code <= {2'b10,upRow[39 :36 ]};
						35: Code <= {2'b10,upRow[35 :32 ]};
						36: Code <= {2'b10,upRow[31 :28 ]};
						37: Code <= {2'b10,upRow[27 :24 ]};
						38: Code <= {2'b10,upRow[23 :20 ]};
						39: Code <= {2'b10,upRow[19 :16 ]};
						40: Code <= {2'b10,upRow[15 :12 ]};
						41: Code <= {2'b10,upRow[11 :8  ]};
						42: Code <= {2'b10,upRow[7  :4  ]};
						43: Code <= {2'b10,upRow[3  :0  ]};
						
						44: Code <= 6'b001100;
						45: Code <= 6'b000000;
						
						46: Code <= {2'b10,doRow[127:124]};
						47: Code <= {2'b10,doRow[123:120]};
						48: Code <= {2'b10,doRow[119:116]};
						49: Code <= {2'b10,doRow[115:112]};
						50: Code <= {2'b10,doRow[111:108]};
						51: Code <= {2'b10,doRow[107:104]};
						52: Code <= {2'b10,doRow[103:100]};
						53: Code <= {2'b10,doRow[99 :96 ]};
						54: Code <= {2'b10,doRow[95 :92 ]};
						55: Code <= {2'b10,doRow[91 :88 ]};
						56: Code <= {2'b10,doRow[87 :84 ]};
						57: Code <= {2'b10,doRow[83 :80 ]};
						58: Code <= {2'b10,doRow[79 :76 ]};
						59: Code <= {2'b10,doRow[75 :72 ]};
						60: Code <= {2'b10,doRow[71 :68 ]};
						61: Code <= {2'b10,doRow[67 :64 ]};
						62: Code <= {2'b10,doRow[63 :60 ]};
						63: Code <= {2'b10,doRow[59 :56 ]};
						64: Code <= {2'b10,doRow[55 :52 ]};
						65: Code <= {2'b10,doRow[51 :48 ]};
						66: Code <= {2'b10,doRow[47 :44 ]};
						67: Code <= {2'b10,doRow[43 :40 ]};
						68: Code <= {2'b10,doRow[39 :36 ]};
						69: Code <= {2'b10,doRow[35 :32 ]};
						70: Code <= {2'b10,doRow[31 :28 ]};
						71: Code <= {2'b10,doRow[27 :24 ]};
						72: Code <= {2'b10,doRow[23 :20 ]};
						73: Code <= {2'b10,doRow[19 :16 ]};
						74: Code <= {2'b10,doRow[15 :12 ]};
						75: Code <= {2'b10,doRow[11 :8  ]};
						76: Code <= {2'b10,doRow[7  :4  ]};
						77: Code <= {2'b10,doRow[3  :0  ]};
						default: Code <= 6'h10;
				endcase
		end
end
		
// refresh
always@(posedge clk, posedge rst)
begin
		if(rst) refresh <= 1;
		else refresh <= count[16];
end

endmodule