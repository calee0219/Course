//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright 
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   2016 DLAB Course
//   Lab02      :   Convcor
//   Author     :   Hsiao-Kai, Liao
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : PATTERN.v
//   Module Name : PATTERN
//   Release version :     V1.0 
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//###########################################################################


`timescale 1ns/10ps

`define clk_PERIOD  10.0
//`define DELAY 2.5 
`define PATTERN_NUM 5000

module PATTERN(	
	clk, 
	rst_n, 
	in_valid, 
	in_a,
	in_b,
	in_mode,	
	out_valid, 
	out
);
				
//---------------------------------
//  input and output declaration
//---------------------------------  

output           clk;
output           rst_n;
output           in_valid;
output 	[15:0]   in_a;
output 	[15:0]   in_b;
output 	         in_mode;
input            out_valid;
input   [35:0]   out;

//----------------------------------
// reg and wire declaration
//---------------------------------

reg 	         clk;
reg 	         rst_n;
reg 	         in_valid;
reg 	[15:0]   in_a;
reg 	[15:0]   in_b;
reg 	         in_mode;

reg     [7:0]    a_real, a_img;
reg     [7:0]    b_real, b_img;
reg     [17:0]   out_real, out_img;
//reg     [35:0]   Y_out, C_out;

integer file_in_ar, file_in_ai, file_in_br, file_in_bi;
integer file_outr,file_outi,file_mod, scan_filein, scan_fileout;
integer i, pn, in_num, out_num, pass_num;
integer latency, total_latency, correct;  
integer mode;

initial begin
	clk = 1'b0;
	forever #(`clk_PERIOD/2.0) clk = ~clk;
end

initial begin
	file_in_ar = $fopen("IN_A_REAL.txt","r");
	file_in_ai = $fopen("IN_A_IMG.txt","r");
	file_in_br = $fopen("IN_B_REAL.txt","r");
	file_in_bi = $fopen("IN_B_IMG.txt","r");
	file_outr =  $fopen("OUT_REAL.txt","r");
	file_outi =  $fopen("OUT_IMG.txt","r");
	file_mod =   $fopen("MODE.txt","r");
	
    latency=0; 
	
	rst_n <= 1'b1;
	in_valid <= 1'b0;
	in_a <= 8'dx;
    in_b <= 8'dx;
	
    @(posedge clk);
	      rst_n <= 1'b0;
	
	@(posedge clk);	  
	      rst_n <= 1'b1;
		  
	@(negedge clk);
		  check_reset;

		  
	for(i = 0; i < `PATTERN_NUM; i = i + 1)
	begin
	   
	   @(posedge clk);
	   @(posedge clk);
	   
	   out_num = 0;
	   latency=0; 
	
	   for(pn = 0; pn < 3; pn = pn + 1)	
	   begin
		     in_valid <= 1'b1;
		     scan_filein=$fscanf(file_in_ar, "%d\n", a_real);
			 scan_filein=$fscanf(file_in_ai, "%d\n", a_img);
			 scan_filein=$fscanf(file_in_br, "%d\n", b_real);
			 scan_filein=$fscanf(file_in_bi, "%d\n", b_img);
			 in_a <= {a_real,a_img};
			 in_b <= {b_real,b_img};
			 
			 if(pn==0) begin
				scan_filein=$fscanf(file_mod, "%d\n", in_mode);	
				mode <= in_mode;
			 end
			 else
				in_mode <= 'dx;
				
			@(negedge clk);
				check_reset;
				
			 @(posedge clk);
	   end			  

	   in_valid <= 1'b0;
	   in_a <= 8'dx;	   
	   in_b <= 8'dx;
	   in_mode <=  1'bx;	
	   
	   @(negedge clk);
	   
       while(!(out_valid === 1'b1))
       begin
          if(latency >= 100)
		  begin
		     $display("");
			 $display("=================================================");
			 $display("  Latency more than 100 !!!!                     ");
			 $display("=================================================");
			 $display("");	
			 $finish;
		  end
		  latency = latency + 1;	
		  @(negedge clk);
       end	
	   
	   
	   
	   out_num = 0;
	   
	   while(out_valid === 1'b1) 
	   begin
	   
		  if(out_num>1&&mode==1)
		  begin
			 $display("");
			 $display("=================================================");
			 $display("  out_valid more than 1 cycle !!!!               ");
			 $display("=================================================");
			 $display("");
			 @(negedge clk);	
			 $finish;
		  end
	   
		  if(out_num > 5)
		  begin
			 $display("");
			 $display("=================================================");
			 $display("  out_valid more than 5 cycle !!!!               ");
			 $display("=================================================");
			 $display("");
			 @(negedge clk);	
			 $finish;
		  end
	   
		  scan_fileout=$fscanf(file_outr, "%d\n", out_real);
		  scan_fileout=$fscanf(file_outi, "%d\n", out_img);
		  //C_OUT <= {out_real,out_img};
		  
		  if(out_real !== out[35:18] || out_img !== out[17:0])
		  begin
			 $display("");
			 $display("=================================================");
			 $display("  Failed!!  PATTERN %3d is wrong!                ", i+1);
			 $display("=================================================");
			 $display("");
			 @(negedge clk);	
			 $finish;
		  end
		  
		  out_num = out_num + 1; 
		  
		  @(negedge clk);
		
		end
		
		if(out_num != 5 && mode == 0) begin
			$display("");
			$display("=================================================");
			$display("  out_valid less than 5 cycle !!!!               ");
			$display("=================================================");
			$display("");
			@(negedge clk);	
			$finish;
		end
		
		$display("");
		$display(" Pass pattern %3d ", i+1);
				    
   end

	
    $display("\033[0;33m======================================================================\033[m");
	$display("\033[1;35m           ij1PXqSur,                \033[m");
	$display("\033[1;35m        ,i:,        :7:         \033[0;32m CONGRATULATION!! \033[m");
	$display("\033[1;35m      i7i         5.   i2r    \033[0;32m You pass all pattern!! \033[m"); 
	$display("\033[1;35m     L.          :. :    r7  \033[m");
	$display("\033[1;35m   .q      v7             i  \033[0;32m \033[m"); 
	$display("\033[1;35m   M       M              .:   .i.    \033[m"); 
	$display("\033[1;35m  iX                 j@;   :  :  : .  \033[m"); 
	$display("\033[1;35m  Y7                 ,@@   J ..   ::i \033[m"); 
	$display("\033[1;35m  r7            @Bu        JB7  :iii. \033[m"); 
	$display("\033[1;35m   @            .@@         .B  r:    \033[m");
	$display("\033[1;35m   uE               ,   T    8  u     \033[m");
	$display("\033[1;35m    Pu              U  :B   Fi :v     \033[m");
	$display("\033[1;35m     rEi             iU    S:  N      \033[m");
	$display("\033[1;35m       USv,             :7   F.      \033[m"); 
	$display("\033[1;35m         .,:irLr,      .    J:       \033[m"); 
	$display("\033[1;35m          .::irvrrL7      .S.        \033[m"); 
	$display("\033[1;35m        ,ui        i:     :r         \033[m"); 
	$display("\033[1;35m       r5     :           7:         \033[m"); 
	$display("\033[1;35m      iu    :.B,.         2 \033[0;35m LNSQu.   ML      vB;    :MF.    HB. @M \033[m");
	$display("\033[1;35m    :r    .:  j          r. \033[0;35m M@iiX@; @:B    :@q@@   OOMBQ    K@  Bk \033[m");
	$display("\033[1;35m   ,u:i:.i::.i.         vi  \033[0;35m BB  0B  @::@   P@:  Y .@0   V   5B  @I \033[m");
	$display("\033[1;35m    .:i    ,r,         1r   \033[0;35m MBM5;  qB  Ju   N5.     '@Ei    B@ .BH \033[m");
	$display("\033[1;35m         ,rv         ;1,    \033[0;35m BX    .@qi8BM: u  :@u :u  :F@          \033[m"); 
	$display("\033[1;35m .::.,.J          .rv:      \033[0;35m 7N    JL   iL.  Jv;,   LYru:    rU  5M \033[m"); 
	$display("\033[1;35m .r.;:.i..     .::.                  \033[m"); 
	$display("\033[0;33m======================================================================\033[m");
	$finish;	
	
end


task check_reset;
	if(out_valid !== 1'b0 || out !== 36'd0) begin
		$display("");
		$display("=================================================");
		$display("  output should be reset !!!!               ");
		$display("=================================================");
		$display("");
		@(negedge clk);
		$finish;
	end
endtask



endmodule
