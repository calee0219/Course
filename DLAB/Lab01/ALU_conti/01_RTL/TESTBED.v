`include "PATTERN.v"
`include "ALU.v"

module TESTBED;

wire [3:0] A, B;
wire [1:0] MODE;
wire [7:0] OUT;

initial begin
  $fsdbDumpfile( "ALU.fsdb" );
  $fsdbDumpvars;
end

ALU U_ALU( .OUT( OUT ), .A( A ), .B( B ), .MODE( MODE ) );
PATTERN I_PATTERN( .OUT( OUT ), .A( A ), .B( B ), .MODE( MODE ) );

endmodule
