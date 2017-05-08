`timescale 1ns/10ps
`define CYCLE_PERIOD 4.0

module PATTERN(
	input [10:0] out,
	input out_valid,
	output reg [3:0] in,
	output reg [1:0] mode,
	output reg in_valid,
	output reg clk,
	output reg rst_n
);

parameter CYCLE = `CYCLE_PERIOD;
parameter PATTERN_NUM = 1000;

reg [7:0] times[0:8];
reg [2:0] mode_t;
reg [7:0] length,wait_clk,i,k,l;
reg	[4:0] t1,t2,t3,t4,t5,t6,t7,t8,t9;

integer latency, total_latency;
integer pattern_num, j;
integer max,min,gold;

initial begin
	total_latency = 0;
end

initial begin
	clk = 0;
	#10;
	$display("before clk");
	forever #(CYCLE/2) clk = ~clk;
end

initial begin
	in <= 'dx;
	mode <= 'dx;
	in_valid <= 'bx;
	rst_n <= 1'b1;
	mode<='dx;
	$display("before reset");
	#2;
	rst_n <= 1'b0;
	
	#4;
	rst_n <= 1'b1;
	
	check_rst;
	
	in_valid <= 'b0;
	
	@(negedge clk);
	
	pattern_num=0;
	input_task1;
	ans_calc;
	wait_out;
	check_ans;
	
	for(pattern_num=1;pattern_num<PATTERN_NUM;pattern_num=pattern_num+1) begin
		
		input_task;
		
		ans_calc;
		
		wait_out;
		
		check_ans;
	
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

	if(out !== 'd0 || out_valid !== 1'b0) begin
		$display("");
		$display("=================================================");
		$display("  Output should be reset !!!!               ");
		$display("=================================================");
		$display("");
		@(negedge clk);
		$finish;
	end

endtask



task check_out_vaild;

	if(out_valid !== 1'b0) begin
		$display("");
		$display("=================================================");
		$display("  Out_valid should not be HIGH while in_valid is HIGH !!!!");
		$display("=================================================");
		$display("");
		@(negedge clk);
		$finish;
	end

endtask

task input_task1;begin
	for(i=0;i<9;i=i+1) begin
			times[i] = 0;
	end
	
	length={$random()}%'d10+1;
	mode_t=2;
	max=0;
	i=0;
	while (i<9)begin
		while (length>0 && times[8]<31)begin
			in_valid <= 1'b1;
			in <= i+1;
			times[i]=times[i]+1;
			if (times[i]>max) max=times[i];
			if (times[i]==31) i=i+1;
			length<=length-1;
			check_out_vaild;
			
			t1=times[0]; t2=times[1]; t3=times[2]; t4=times[3]; t5=times[4]; 
			t6=times[5]; t7=times[6]; t8=times[7]; t9=times[8];
			@(negedge clk);
		end

		in <= 'dx;
		in_valid <= 1'b0;
		wait_clk={$random()}%'d20;
		repeat(wait_clk)@(negedge clk);
		
		length={$random()}%'d10+1;
		k=k-1;
	end
	
	in <= 0;
	in_valid <= 1'b1;
	
	@(negedge clk);
	
	in <= 'dx;
	in_valid <= 1'b0;
	mode<=mode_t;
	
	@(negedge clk);
	mode<='dx;
end endtask

task input_task;begin
	for(i=0;i<9;i=i+1) begin
			times[i] = 0;
	end
	
	k={$random()}%'d31+1;
	length={$random()}%'d10+1;
	mode_t={$random()}%'d3;
	max=0;
	while (k>0 && max<31)begin
		while (length>0 && max<31)begin
			i={$random()}%'d9;
			in_valid <= 1'b1;
			in <= i+1;
			times[i]=times[i]+1;
			if (times[i]>max) max=times[i];
			length<=length-1;
			check_out_vaild;
			
			t1=times[0]; t2=times[1]; t3=times[2]; t4=times[3]; t5=times[4]; 
			t6=times[5]; t7=times[6]; t8=times[7]; t9=times[8];
			@(negedge clk);
		end

		in <= 'dx;
		in_valid <= 1'b0;
		wait_clk={$random()}%'d20;
		repeat(wait_clk)@(negedge clk);
		
		length={$random()}%'d10+1;
		k=k-1;
	end
	
	in <= 0;
	in_valid <= 1'b1;

	
	@(negedge clk);
	
	in <= 'dx;
	in_valid <= 1'b0;
	mode<=mode_t;
	
	@(negedge clk);
	mode<='dx;
end endtask

task ans_calc;begin
	min=33;
	gold=0;
	case (mode_t)
		2'd0:gold=max;
		2'd1:begin
				for (i=0;i<9;i=i+1)begin
					if (times[i]<min) min=times[i];
				end
				gold=min;
			end
		2'd2:begin
				for (i=0;i<9;i=i+1)begin
					gold=gold+(i+1)*times[i];
				end
			end
		default:gold=0;
	endcase
end endtask

task wait_out;begin

	latency = -1;

	while(!(out_valid === 1'b1)) begin
		if(latency > 100) begin
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

end endtask

task check_ans;begin
	i=0;
	while(out_valid) begin			
		if(out !== gold) begin
			$display("");
			$display("=================================================");
			$display("  Failed!!  PATTERN %4d is wrong!                ", pattern_num+1);
			$display("  mode=%d    gold=%d     your ans=%d       ",mode_t,gold,out);
			$display("=================================================");
			$display("");
			@(negedge clk);	
			$finish;
		end
		
		if(i>=1)
			begin
			    $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
				$display ("                                                                        FAIL!                                                               ");
				$display ("                                                           Outvalid is more than 1 cycles                                                   ");
				$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
				repeat(9) @(negedge clk);
				$finish;
			end
		i=i+1;
		@(negedge clk);
	end
		
	$display("");
	$display(" Pass pattern %3d ", pattern_num+1);
	
	@(negedge clk);

end endtask



endmodule
