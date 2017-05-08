`timescale 1ns/10ps

module PATTERN( OUT, A, B, MODE );

input [7:0] OUT;
output [3:0] A, B;
output [1:0] MODE;

reg [7:0] AB;
reg [1:0] MODE;
reg [7:0] ans;
integer  i  ;
assign A = AB[7:4];
assign B = AB[3:0];

always @( * ) begin
  case ( MODE )
	  2'd0: ans =  AB[7:4]  +  AB[3:0] ;
	  2'd1: ans =  AB[7:4]  &  AB[3:0] ;
	  2'd2: ans =  (AB[7:4]  >  AB[3:0])? 1:0 ;
	  2'd3: ans =  AB[7:4]  >>  AB[3:0] ;
  endcase
end

initial begin
  AB = 0;
  MODE = 0;
  
	i = 1;
  while ( 1 ) begin
    #1
    if ( ans !== OUT ) begin
      $display( "error, ans = %d, out = %d", ans, OUT );
	  $finish;
	  end
	$display("You pass %d test!",i);
	
    if ( AB == 255 )
      MODE = MODE + 1;
	   
    AB = AB + 1;
	i = i + 1;
	if( AB==255 && MODE==3) begin
		$display("You pass %d test!",i);
		$finish;
	end
  end

  
end

endmodule
