
`timescale 1ns/10ps
`define CLK_PERIOD  4.0

module PATTERN(
	output reg       clk,
	output reg [2:0] circle1,
	output reg [2:0] circle2,
	output reg [4:0] in,
	output reg       in_valid,
	output reg       rst_n,
	input [5:0]      out,
	input            out_valid
);

reg [4:0] pixel1 [0:7];
reg [4:0] pixel2 [0:7];

parameter CLK = `CLK_PERIOD;
parameter PATTERN_NUM = 10;

integer latency, total_latency;
integer pattern_num;
integer round;
integer i,j;
integer op;
integer ans[0:7];
integer unsort[0:7];
integer swap;
integer cir1, cir2;

initial begin
	total_latency = 0;
end

initial begin
	clk = 0;
	forever #CLK clk = ~clk;
end

initial begin
	in <= 'dx;
	in_valid <= 'bx;
	rst_n <= 1'b1;

	#16;
	rst_n <= 1'b0;

	#8;
	rst_n <= 1'b1;

	check_out_rst;
	check_out_valid_rst;

	in_valid <= 'b0;

	#16
	@(negedge clk);
	for(pattern_num=0;pattern_num<PATTERN_NUM;pattern_num=pattern_num+1) begin

        check_out_valid_rst;

        if(pattern_num === 0) begin
            cir1 = 0;
            cir2 = 0;
            pixel1[0] = 31; pixel1[1] = 31; pixel1[2] = 31; pixel1[3] = 31; pixel1[4] = 31; pixel1[5] = 31; pixel1[6] = 31; pixel1[7] = 31;
            pixel2[0] = 31; pixel2[1] = 31; pixel2[2] = 31; pixel2[3] = 31; pixel2[4] = 31; pixel2[5] = 31; pixel2[6] = 31; pixel2[7] = 31;
        end else if(pattern_num === 2) begin
            cir1 = 0;
            cir2 = 0;
            pixel1[0] = 0; pixel1[1] = 1; pixel1[2] = 2; pixel1[3] = 3; pixel1[4] = 4; pixel1[5] = 5; pixel1[6] = 6; pixel1[7] = 7;
            pixel2[0] = 0; pixel2[1] = 1; pixel2[2] = 2; pixel2[3] = 3; pixel2[4] = 4; pixel2[5] = 5; pixel2[6] = 6; pixel2[7] = 7;
        end else begin

            cir1 = {$random()}%8;
            cir2 = {$random()}%8;
            for(i=0;i<8;i=i+1) begin
                pixel1[i] = $random()%32;
                pixel2[i] = $random()%32;
            end

        end

        for(i=0;i<8;i=i+1) begin
            if(i == 0) begin circle1 <= cir1; circle2 <= cir2; end
            else begin circle1 <= 1'bx; circle2 <= 1'bx; end
            in_valid <= 1'b1;
            in <= pixel1[i];

            check_out_valid_rst;

            @(negedge clk);
        end
        for(i=0;i<8;i=i+1) begin
            in_valid <= 1'b1;
            in <= pixel2[i];

            check_out_valid_rst;

            @(negedge clk);
        end

        operate;

		in <= 'dx;
		in_valid = 1'b0;

		wait_out;

        for(i=0;i<8;i=i+1) begin

			if(out !== ans[i]) begin
				$display("");
				$display("=================================================");
				$display("  Failed!!  PATTERN %4d is wrong!                ", pattern_num+1);
				$display("  ans is %d      your ans is %d          ", ans[i],out);
				$display("=================================================");
				$display("");
				repeat(8)@(negedge clk);	
				$finish;
			end
			
			@(negedge clk);
		end

		$display("");
		$display(" Pass pattern %3d ", pattern_num+1);

        check_out_valid_rst;

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

task check_out_valid_rst;
begin
	if(out_valid !== 1'b0) begin
		$display("");
		$display("========================================");
		$display("  'out_valid' should be reset !!!!!     ");
		$display("========================================");
		$display("");
		@(negedge clk);
		$finish;
	end
end
endtask

task check_out_rst;
begin
	if(out !== 1'b0) begin
		$display("");
		$display("========================================");
		$display("  'out' should be reset !!!!!           ");
		$display("========================================");
		$display("");
		@(negedge clk);
		$finish;
	end
end
endtask

task wait_out;
begin
	latency = 0;

	while(!(out_valid === 1'b1)) begin
		if(latency > 100) begin
			$display("");
			$display("========================================");
			$display("  Latency too mord !!!!                 ");
			$display("========================================");
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

task operate;
begin
	op = cir1 - cir2;
	for(i=0;i<8;i=i+1) begin
		while(i+op<0) op=op+8;
		while(i+op>7) op=op-8;
		ans[i] = pixel1[i] + pixel2[i+op];
        unsort[i] = pixel1[i] + pixel2[i+op];
	end
	for(i=0;i<8;i=i+1) begin
		for(j=0;j<7;j=j+1) begin
			if(ans[j]>ans[j+1]) begin
				swap = ans[j];
				ans[j] = ans[j+1];
				ans[j+1] = swap;
			end
		end
	end
end
endtask

endmodule
