
`timescale 1ns/10ps
`define CYCLE_TIME 4.0

module PATTERN(
	// Output signals
	clk,
	rst_n,
	in,
	bomb,
	in_valid1,
	hit,
	in_valid2,
  // Input signals
 
  out_valid,
  out
  
);

output	reg 				clk,rst_n,in_valid1,in_valid2;
output  reg [7:0]in,bomb;
output reg [5:0]hit;
input 							out_valid;
input		[6:0]	out;

//================================================================
// parameters & integer
//================================================================
real		CYCLE = `CYCLE_TIME;

integer total_latency;
integer lat;

integer i,j;
integer seed1 = 10,seed2 = 100,seed3=150,seed4 = 160,seed5 = 10;
integer patnum;
integer gold;
//================================================================
// wire & registers 
//================================================================
reg [5:0]tmp;
reg [7:0]map[7:0];
reg [7:0]bomb_t[7:0];
reg [7:0]bomb_t_t;
reg [8:0]hit_t[9:0];

reg [63:0]flag;

integer befor,after;

//================================================================
// clock
//================================================================
initial clk = 0;

always #(CYCLE/2.0) clk = ~clk;

//================================================================
// initial
//================================================================
initial begin

for(i=0;i<8;i=i+1)begin
	map[i] = 0;
	bomb_t[i] = 0;
end

flag = 'b0;
befor= 0;
after = 0;

for(i=0;i<10;i=i+1)
	hit_t[i] = 64;

total_latency = 0;
rst_n = 1;
in_valid1 = 0;
in_valid2 = 0;
force clk = 0;
in = 'dx;
bomb = 'dx;
hit ='dx;

reset_signal_task;


for(patnum=0;patnum<1000;patnum=patnum+1)begin
repeat(1)@(posedge clk);

if(patnum==0)begin 
flag = 'b0;
befor= 0;
after = 0;
special_input0;
end
else if(patnum==1)begin
 flag = 'b0;
 befor= 0;
after = 0;
 
 special_input1;
end
else begin
flag = 'b0;
befor= 0;
after = 0;
 input_task;

end
wait_out_valid;
check_ans;
$display("you pass NO.%d PATTERN",patnum+1);
end


PASS;


end

//================================================================
// task
//================================================================


task PASS;begin
$display ("----------------------------------------------------------------------------------------------------------------------");
$display ("                                                  Congratulations!                						            ");
$display ("                                           You have passed all patterns!          						            ");
$display ("                                           Your execution cycles = %5d cycles   						            ", total_latency);
$display ("                                           Your clock period = %.1f ns        					                ", CYCLE);
$display ("                                           Your total latency = %.1f ns         						            ", total_latency*CYCLE);
$display ("----------------------------------------------------------------------------------------------------------------------");
$finish;	
end 
endtask






task reset_signal_task; begin 
    #(0.5);   rst_n=0;
	
	#(2.0);
	if((out_valid !== 0)||(out !== 0)) begin
		//fail;
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
		$display ("                                                                        FAIL!                                                               ");
		$display ("                                                  Output signal should be 0 after initial RESET at %t                                 ",$time);
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");

		// repeat(2) @(negedge clk);
		$finish;
	end
	
	#(10);   rst_n=1;
	#(3);   release clk;
end endtask

/*
task random_task; begin

for(i=0;i<8;i=i+1)
	map[i]  = $random()%'d256;

for(i=0;i<8;i=i+1)begin
	for(j=0;j<8;j = j+1) begin
		if(map[i][j]) bomb_t[i][j] = 1;
		else bomb_t[i][j] = 1'b0;
		end
end		
for(i=0;i<10;i=i+1)begin
	
	while(hit_t[i] =='d64)begin
		tmp = $random()%'d64;
		if(flag[tmp]=='b0)begin
		hit_t[i] = tmp;
		flag[tmp] = 'b1;
		end
		else hit_t[i] = 'd64;
	end

end


execution;
end
endtask
*/

task execution;begin

	/*for(i=0;i<8;i=i+1)
		for(j=0;j<8;j=j+1)
			if(map[i][j]==1) befor = befor+1;*/
			
	


	for(i=0;i<10;i=i+1)begin
	
	
		if(map[hit_t[i][5:3]][hit_t[i][2:0]]==1)begin
		
			if(bomb_t[hit_t[i][5:3]][hit_t[i][2:0]]==1)begin
			
			
				if(hit_t[i][5:3]==0&&hit_t[i][2:0]==0) begin
					map[0][0]=0;
					map[0][1]=0;
					
					map[1][0]=0;
					map[1][1]=0;
				
				end
				else if(hit_t[i][5:3]==7&&hit_t[i][2:0]==0)begin
					map[7][0]=0;
					map[7][1]=0;
					
					map[6][0]=0;
					map[6][1]=0;
				
				end
				else if(hit_t[i][5:3]==7&&hit_t[i][2:0]==7)begin
					map[7][7]=0;
					map[7][6]=0;
					
					map[6][7]=0;
					map[6][6]=0;
				
				end
				else if(hit_t[i][5:3]==0&&hit_t[i][2:0]==7)begin
					map[0][7]=0;
					map[0][6]=0;
					
					map[1][7]=0;
					map[1][6]=0;
				
				end
				else if(hit_t[i][2:0]==0)begin
					map[hit_t[i][5:3]][0] = 0;
					map[hit_t[i][5:3]-1][0] = 0;
					map[hit_t[i][5:3]+1][0] = 0;
					map[hit_t[i][5:3]][1] = 0;
					map[hit_t[i][5:3]-1][1] = 0;
					map[hit_t[i][5:3]+1][1] = 0;
				end
				else if(hit_t[i][2:0]==7)begin
					map[hit_t[i][5:3]][7] = 0;
					map[hit_t[i][5:3]-1][7] = 0;
					map[hit_t[i][5:3]+1][7] = 0;
					map[hit_t[i][5:3]][6] = 0;
					map[hit_t[i][5:3]-1][6] = 0;
					map[hit_t[i][5:3]+1][6] = 0;
				end
				
				else if(hit_t[i][5:3]==0)begin
					map[hit_t[i][5:3]][hit_t[i][2:0]] = 0;
					map[hit_t[i][5:3]][hit_t[i][2:0]-1] = 0;
					map[hit_t[i][5:3]][hit_t[i][2:0]+1] = 0;
					map[hit_t[i][5:3]+1][hit_t[i][2:0]] = 0;
					map[hit_t[i][5:3]+1][hit_t[i][2:0]-1] = 0;
					map[hit_t[i][5:3]+1][hit_t[i][2:0]+1] = 0;
				end
				else if(hit_t[i][5:3]==7)begin
					map[hit_t[i][5:3]][hit_t[i][2:0]] = 0; 
					map[hit_t[i][5:3]][hit_t[i][2:0]-1] = 0; 
					map[hit_t[i][5:3]][hit_t[i][2:0]+1] = 0; 
					map[hit_t[i][5:3]-1][hit_t[i][2:0]] = 0;
					map[hit_t[i][5:3]-1][hit_t[i][2:0]-1] = 0;
					map[hit_t[i][5:3]-1][hit_t[i][2:0]+1] = 0;
				end
				else begin
				
					map[hit_t[i][5:3]][hit_t[i][2:0]] = 0;
					map[hit_t[i][5:3]][hit_t[i][2:0]-1] = 0;
					map[hit_t[i][5:3]][hit_t[i][2:0]+1] = 0;
					map[hit_t[i][5:3]-1][hit_t[i][2:0]] = 0;
					map[hit_t[i][5:3]-1][hit_t[i][2:0]-1] = 0;
					map[hit_t[i][5:3]-1][hit_t[i][2:0]+1] = 0;
					map[hit_t[i][5:3]+1][hit_t[i][2:0]] = 0;
					map[hit_t[i][5:3]+1][hit_t[i][2:0]-1] = 0;
					map[hit_t[i][5:3]+1][hit_t[i][2:0]+1] = 0;
				end
			end
			else map[hit_t[i][5:3]][hit_t[i][2:0]] = 0;
		
		
		
		
		
		end
	
	
	
	
	
	end

	for(i=0;i<8;i=i+1)
		for(j=0;j<8;j=j+1)
			if(map[i][j]==1) after = after+1;

	gold = befor-after;


end
endtask


task special_input0; begin

	repeat(2)@(negedge clk);
	in_valid1 = 1;
	for(i= 0;i<10;i=i+1)begin
	
		if(i<8)begin
		map[i]  = 0;
		in = map[i]; 
		for(j=0;j<8;j=j+1)begin
			if(in[j])begin
			befor = befor+1;
			bomb[j] = $random()%'d2;
			
			end
			else bomb[j] = 0;
			
			
		end	
		
	bomb_t[i] = bomb;
		end
		else begin
			in_valid1 = 0;
			in = 'dx;
			bomb = 'dx;
		
		end
	
	//for(i=0;i<10;i=i+1)begin
	
	hit_t[0]<=0;
	hit_t[1]<=7;
	hit_t[2]<=56;
	hit_t[3]<=63;
	hit_t[4]<=4;
	hit_t[5]<=60;
	hit_t[6]<=24;
	hit_t[7]<=23;
	hit_t[8]<=1;
	hit_t[9]<=25;


	//end
	in_valid2 = 1;
	hit = hit_t[i];
	@(negedge clk);
	
	end
	
	


	execution;

	for(i=0;i<10;i=i+1)
	hit_t[i] = 64;
	in_valid2 = 0;
	
	hit = 'dx;
	




end
endtask






task special_input1; begin

	repeat(2)@(negedge clk);
	in_valid1 = 1;
	for(i= 0;i<10;i=i+1)begin
	
		if(i<8)begin
		map[i]  = 1;
		in = map[i]; 
		for(j=0;j<8;j=j+1)begin
			if(in[j])begin
			befor = befor+1;
			bomb[j] = 1;
			
			end
			else bomb[j] = 0;
			
			
		end	
		
	bomb_t[i] = bomb;
		end
		else begin
			in_valid1 = 0;
			in = 'dx;
			bomb = 'dx;
		
		end
	
	//for(i=0;i<10;i=i+1)begin
	
	hit_t[0]<=0;
	hit_t[1]<=7;
	hit_t[2]<=56;
	hit_t[3]<=63;
	hit_t[4]<=4;
	hit_t[5]<=60;
	hit_t[6]<=24;
	hit_t[7]<=23;
	hit_t[8]<=1;
	hit_t[9]<=25;


	//end
	in_valid2 = 1;
	hit = hit_t[i];
	@(negedge clk);
	
	end
	
	


	execution;

	for(i=0;i<10;i=i+1)
	hit_t[i] = 64;
	in_valid2 = 0;
	
	hit = 'dx;
	




end
endtask


task input_task; begin
	repeat(2)@(negedge clk);
	in_valid1 = 1;
	for(i= 0;i<10;i=i+1)begin
	
		if(i<8)begin
		map[i]  = $random()%'d256;
		in = map[i]; 
		for(j=0;j<8;j=j+1)begin
			if(in[j])begin
			befor = befor+1;
			bomb[j] = $random()%'d2;
			
			end
			else bomb[j] = 0;
			
			
		end	
		
	bomb_t[i] = bomb;
		end
		else begin
			in_valid1 = 0;
			in = 'dx;
			bomb = 'dx;
		
		end
	
	//for(i=0;i<10;i=i+1)begin
	
	while(hit_t[i] =='d64)begin
		tmp = $random()%'d64;
		if(flag[tmp]=='b0)begin
		hit_t[i] = tmp;
		flag[tmp] = 'b1;
		end
		else hit_t[i] = 'd64;
	end

	//end
	in_valid2 = 1;
	hit = hit_t[i];
	@(negedge clk);
	
	end
	
	/*for(i=0;i<10;i=i+1)begin
	
	while(hit_t[i] =='d64)begin
		tmp = $random()%'d64;
		if(flag[tmp]=='b0)begin
		hit_t[i] = tmp;
		flag[tmp] = 'b1;
		end
		else hit_t[i] = 'd64;
	end

	end*/


	execution;
/*	in_valid2 = 1;
	for(i=0;i<10;i=i+1)begin
	hit = hit_t[i];
	
	@(negedge clk);
	
	end*/
	for(i=0;i<10;i=i+1)
	hit_t[i] = 64;
	in_valid2 = 0;
	
	hit = 'dx;
	
end endtask



task wait_out_valid; begin
  lat = 0;
  while(!out_valid) begin
	

	if(lat == 100) begin
	   // fail;
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
		$display ("                                                                        FAIL!                                                               ");
		$display ("                                                     The execution latency are over 100   cycles                                            ");
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");

		repeat(2)@(negedge clk);
		$finish;
	end
	lat = lat + 1;
	@(negedge clk);
  end
  total_latency = total_latency + lat;
end endtask

task check_ans;begin
	
	lat=0;
	while(out_valid==='b1)begin
	
	
		
		
		if(lat>0)begin
			//fail;
				$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
				$display ("                                                                        FAIL!                                                               ");
				$display ("                                                       outvalid is more than 1 cycles                                                   ");
				$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
				repeat(9) @(negedge clk);
				$finish;
	
		end
		
	
		
		
		
			
		if (out!==gold)begin
			
				//	fail;
					$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
					$display ("                                                                        FAIL!                                                               ");
					$display ("                                                                PATTERN NO.%4d                                                           ",patnum+1);
					$display ("                                                Ans(value): %d,  Your output : %d  at %8t                                              ",gold,out,$time);
					
					$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
					repeat(9) @(negedge clk);
					$finish;
		
		end
		
		
		
		
		
	
	
	lat= lat+1;
	@(negedge clk);
	end
/*
	if(lat<8)begin
	$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
			$display ("                                                                        FAIL!                                                               ");
			$display ("                                                        Outvalid is less than 8 cycles                                                     ");
			$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
			$finish;
	end
	*/

end
endtask


endmodule


