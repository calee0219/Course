`define CYCLE_PERIOD 4.0

module PATTERN(
	input [2:0] out,
	input out_valid,
	input ready,
	output reg [2:0] in,
	output reg [2:0] mode,
	output reg in_valid,
	output reg clk,
	output reg rst_n
);

reg [2:0] pixel[0:8];
reg [2:0] mode_t;

parameter CYCLE = `CYCLE_PERIOD;
parameter PATTERN_NUM = 5000;

integer latency, total_latency;
integer round;
integer temp, temp_M[0:8];
integer pattern_num, i, j;

initial begin
	total_latency = 0;
end

initial begin
	clk = 0;
	#10;
	forever #CYCLE clk = ~clk;
end

initial begin
	in <= 'dx;
	mode <= 'dx;
	in_valid <= 'bx;
	rst_n <= 1'b1;
	
	#2;
	rst_n <= 1'b0;
	
	#4;
	rst_n <= 1'b1;
	
	check_rst;
	
	in_valid <= 'b0;
	
	@(negedge clk);
	
	for(pattern_num=0;pattern_num<PATTERN_NUM;pattern_num=pattern_num+1) begin
		
		wait_rdy;
	
		round = {$random()}%10 + 1;
	
		for(i=0;i<9;i=i+1) begin
			pixel[i] = $random();
			in_valid <= 1'b1;
			in <= pixel[i];
			
			check_rst;
			
			@(negedge clk);
		end
		
		in <= 'dx;
		in_valid = 1'b0;
		
		for(i=0;i<round;i=i+1) begin
			
			wait_rdy;
			
			mode_t = {$random()}%7+1;
			
			case(mode_t)
				1: proc_mode1;
				2: proc_mode2;
				3: proc_mode3;
				4: proc_mode4;
				5: proc_mode5;
				6: proc_mode6;
				7: proc_mode7;
			endcase	

			mode <= mode_t;
			in_valid <= 1'b1;
			
			check_rst;
			
			@(negedge clk);
			
			mode <= 'dx;
			in_valid <= 1'b0;
			
		end
		
		wait_rdy;
		
		mode <= 0;
		in_valid <= 1'b1;
		
		@(negedge clk);
		
		mode <= 'dx;
		in_valid <= 1'b0;
		
		wait_out;
		
		for(i=0;i<9;i=i+1) begin
			
			if(out !== pixel[i]) begin
				$display("");
				$display("=================================================");
				$display("  Failed!!  PATTERN %4d is wrong!                ", pattern_num+1);
				$display("  ans is %d      your ans is %d          ", pixel[i],out);
				$display("=================================================");
				$display("");
				repeat(9)@(negedge clk);	
				$finish;
			end
			
			@(negedge clk);
		end
		
		$display("");
		$display(" Pass pattern %3d ", pattern_num+1);
		
		@(negedge clk);
		
	end
	
	@(negedge clk);
	$display ("--------------------------------------------------------------------");
	$display ("                         Congratulations !                          ");
	$display ("                  You have passed all patterns !                    ");
	$display ("                  Your total latency is %6d !                       ", total_latency);
	$display ("--------------------------------------------------------------------");
	@(negedge clk);   
	$finish;
	
end

task check_rst;
begin
	if(out !== 'd0 || out_valid !== 1'b0) begin
		$display("");
		$display("=================================================");
		$display("  Output should be reset !!!!               ");
		$display("=================================================");
		$display("");
		@(negedge clk);
		$finish;
	end
end
endtask

task wait_rdy;
begin
	latency = 0;

	while(!(ready === 1'b1)) begin
		if(latency > 12) begin
			$display("");
			$display("=================================================");
			$display("  Latency too more !!!!               ");
			$display("=================================================");
			$display("");
			@(negedge clk);
			$finish;
		end
		latency = latency + 1;
		total_latency = total_latency + 1;
		@(negedge clk);
	end
end
endtask

task wait_out;
begin
	latency = 0;

	while(!(out_valid === 1'b1)) begin
		if(latency > 12) begin
			$display("");
			$display("=================================================");
			$display("  Latency too more !!!!               ");
			$display("=================================================");
			$display("");
			@(negedge clk);
			$finish;
		end
		latency = latency + 1;
		total_latency = total_latency + 1;
		@(negedge clk);
	end
end
endtask

task proc_mode1;
begin
	for(j=0;j<9;j=j+3) begin
		temp = pixel[j];
		pixel[j] = pixel[j+2];
		pixel[j+2] = temp;
	end

end
endtask

task proc_mode2;
begin
	for(j=0;j<3;j=j+1) begin
		temp = pixel[j];
		pixel[j] = pixel[j+6];
		pixel[j+6] = temp;
	end
end
endtask

task proc_mode3;
begin
	temp_M[0] = pixel[2];
	temp_M[1] = pixel[5];
	temp_M[2] = pixel[8];
	temp_M[3] = pixel[1];
	temp_M[4] = pixel[4];
	temp_M[5] = pixel[7];
	temp_M[6] = pixel[0];
	temp_M[7] = pixel[3];
	temp_M[8] = pixel[6];

	for(j=0;j<9;j=j+1) begin
		pixel[j] = temp_M[j];
	end
end
endtask

task proc_mode4;
begin
	temp_M[0] = pixel[6];
	temp_M[1] = pixel[3];
	temp_M[2] = pixel[0];
	temp_M[3] = pixel[7];
	temp_M[4] = pixel[4];
	temp_M[5] = pixel[1];
	temp_M[6] = pixel[8];
	temp_M[7] = pixel[5];
	temp_M[8] = pixel[2];

	for(j=0;j<9;j=j+1) begin
		pixel[j] = temp_M[j];
	end
end
endtask

task proc_mode5;
begin
	for(j=0;j<9;j=j+3) begin
		if(pixel[j] < 'd7)
			pixel[j] = pixel[j] + 1;
	end
end
endtask

task proc_mode6;
begin
	for(j=1;j<9;j=j+3) begin
		if(pixel[j] < 'd7)
			pixel[j] = pixel[j] + 1;
	end
end
endtask

task proc_mode7;
begin
	for(j=2;j<9;j=j+3) begin
		if(pixel[j] < 'd7)
			pixel[j] = pixel[j] + 1;
	end
end
endtask

endmodule