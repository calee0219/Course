////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: Lab07_IP.v
// /___/   /\     Timestamp: Tue Dec 06 10:34:13 2016
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog D:/Lab07_0416037/ipcore_dir/tmp/_cg/Lab07_IP.ngc D:/Lab07_0416037/ipcore_dir/tmp/_cg/Lab07_IP.v 
// Device	: 3s500efg320-4
// Input file	: D:/Lab07_0416037/ipcore_dir/tmp/_cg/Lab07_IP.ngc
// Output file	: D:/Lab07_0416037/ipcore_dir/tmp/_cg/Lab07_IP.v
// # of Modules	: 1
// Design Name	: Lab07_IP
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module Lab07_IP (
  clk, x_out, x_in
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  output [4 : 0] x_out;
  input [7 : 0] x_in;
  
  // synthesis translate_off
  
  wire sig00000001;
  wire sig00000002;
  wire sig00000003;
  wire sig00000004;
  wire sig00000005;
  wire sig00000006;
  wire sig00000007;
  wire sig00000008;
  wire sig00000009;
  wire sig0000000a;
  wire sig0000000b;
  wire sig0000000c;
  wire sig0000000d;
  wire sig0000000e;
  wire sig0000000f;
  wire sig00000010;
  wire sig00000011;
  wire sig00000012;
  wire sig00000013;
  wire sig00000014;
  wire sig00000015;
  wire sig00000016;
  wire sig00000017;
  wire sig00000018;
  wire sig00000019;
  wire sig0000001a;
  wire sig0000001b;
  wire sig0000001c;
  wire sig0000001d;
  wire sig0000001e;
  wire sig0000001f;
  wire sig00000020;
  wire sig00000021;
  wire sig00000022;
  wire sig00000023;
  wire sig00000024;
  wire sig00000025;
  wire sig00000026;
  wire sig00000027;
  wire sig00000028;
  wire sig00000029;
  wire sig0000002a;
  wire sig0000002b;
  wire sig0000002c;
  wire sig0000002d;
  wire sig0000002e;
  wire \U0/i_synth/gen_sqrt.square_root/gen_iterations[5].gen_last.gen_no_round.gen_sqrt_tmp/d_reg<0> ;
  wire \U0/i_synth/gen_sqrt.square_root/gen_iterations[5].gen_last.gen_no_round.gen_sqrt_tmp/d_reg<1> ;
  wire \U0/i_synth/gen_sqrt.square_root/gen_iterations[5].gen_last.gen_no_round.gen_sqrt_tmp/d_reg<2> ;
  wire \U0/i_synth/gen_sqrt.square_root/gen_iterations[5].gen_last.gen_no_round.gen_sqrt_tmp/d_reg<3> ;
  wire \U0/i_synth/gen_sqrt.square_root/gen_iterations[5].gen_last.gen_no_round.gen_sqrt_tmp/d_reg<4> ;
  wire sig0000002f;
  wire sig00000030;
  wire sig00000031;
  wire sig00000032;
  wire sig00000033;
  wire sig00000034;
  wire sig00000035;
  wire sig00000036;
  wire sig00000037;
  wire sig00000038;
  wire sig00000039;
  wire sig0000003a;
  wire sig0000003b;
  wire sig0000003c;
  wire sig0000003d;
  wire sig0000003e;
  wire sig0000003f;
  wire sig00000040;
  wire sig00000041;
  wire sig00000042;
  wire sig00000043;
  wire \blk0000000c/sig00000064 ;
  wire \blk0000000c/sig00000063 ;
  wire \blk0000000c/sig00000062 ;
  wire \blk0000000c/sig00000061 ;
  wire \blk0000000c/sig00000060 ;
  wire \blk0000000c/sig0000005f ;
  wire \blk0000000c/sig0000005e ;
  wire \blk0000000c/sig0000005d ;
  wire \blk0000000c/sig0000005c ;
  wire \blk0000000c/sig0000005b ;
  wire \blk0000000c/sig0000005a ;
  wire \blk0000000c/sig00000059 ;
  wire \blk0000000c/sig00000058 ;
  wire \blk0000000c/sig00000057 ;
  wire \blk0000000c/sig00000056 ;
  wire \blk0000000c/sig00000054 ;
  wire \blk0000000c/sig0000004e ;
  wire \blk0000002b/sig0000007e ;
  wire \blk0000002b/sig0000007d ;
  wire \blk0000002b/sig0000007c ;
  wire \blk0000002b/sig0000007b ;
  wire \blk0000002b/sig0000007a ;
  wire \blk0000002b/sig00000079 ;
  wire \blk0000002b/sig00000078 ;
  wire \blk0000002b/sig00000077 ;
  wire \blk0000002b/sig00000076 ;
  wire \blk0000002b/sig00000075 ;
  wire \blk0000002b/sig00000074 ;
  wire \blk0000002b/sig00000073 ;
  wire \blk0000002b/sig00000071 ;
  wire \blk0000002b/sig0000006c ;
  wire \blk0000003f/sig000000a4 ;
  wire \blk0000003f/sig000000a3 ;
  wire \blk0000003f/sig000000a2 ;
  wire \blk0000003f/sig000000a1 ;
  wire \blk0000003f/sig000000a0 ;
  wire \blk0000003f/sig0000009f ;
  wire \blk0000003f/sig0000009e ;
  wire \blk0000003f/sig0000009d ;
  wire \blk0000003f/sig0000009c ;
  wire \blk0000003f/sig0000009b ;
  wire \blk0000003f/sig0000009a ;
  wire \blk0000003f/sig00000099 ;
  wire \blk0000003f/sig00000098 ;
  wire \blk0000003f/sig00000097 ;
  wire \blk0000003f/sig00000096 ;
  wire \blk0000003f/sig00000095 ;
  wire \blk0000003f/sig00000094 ;
  wire \blk0000003f/sig00000092 ;
  wire \blk0000003f/sig00000091 ;
  wire \blk0000003f/sig00000090 ;
  wire \blk0000003f/sig0000008f ;
  wire \blk0000003f/sig0000008e ;
  wire \blk0000003f/sig0000008d ;
  wire \blk0000003f/sig0000008c ;
  wire \blk0000003f/sig0000008b ;
  assign
    x_out[4] = \U0/i_synth/gen_sqrt.square_root/gen_iterations[5].gen_last.gen_no_round.gen_sqrt_tmp/d_reg<4> ,
    x_out[3] = \U0/i_synth/gen_sqrt.square_root/gen_iterations[5].gen_last.gen_no_round.gen_sqrt_tmp/d_reg<3> ,
    x_out[2] = \U0/i_synth/gen_sqrt.square_root/gen_iterations[5].gen_last.gen_no_round.gen_sqrt_tmp/d_reg<2> ,
    x_out[1] = \U0/i_synth/gen_sqrt.square_root/gen_iterations[5].gen_last.gen_no_round.gen_sqrt_tmp/d_reg<1> ,
    x_out[0] = \U0/i_synth/gen_sqrt.square_root/gen_iterations[5].gen_last.gen_no_round.gen_sqrt_tmp/d_reg<0> ;
  GND   blk00000001 (
    .G(sig00000001)
  );
  VCC   blk00000002 (
    .P(sig00000002)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk00000003 (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000001e),
    .R(sig00000001),
    .Q(sig00000013)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk00000004 (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000001d),
    .R(sig00000001),
    .Q(sig00000012)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk00000005 (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000001c),
    .R(sig00000001),
    .Q(sig00000011)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk00000006 (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000001b),
    .R(sig00000001),
    .Q(sig00000010)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk00000007 (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000001a),
    .R(sig00000001),
    .Q(sig0000000f)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk00000008 (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000021),
    .R(sig00000001),
    .Q(sig0000000e)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk00000009 (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000020),
    .R(sig00000001),
    .Q(sig0000000d)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk0000000a (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000001f),
    .R(sig00000001),
    .Q(sig0000000c)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk0000000b (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000019),
    .R(sig00000001),
    .Q(sig0000000b)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000024 (
    .C(clk),
    .D(sig00000002),
    .Q(sig00000021)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000025 (
    .C(clk),
    .D(sig0000003c),
    .Q(sig00000020)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000026 (
    .C(clk),
    .D(sig0000002a),
    .Q(sig0000001f)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk00000027 (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000002e),
    .R(sig00000001),
    .Q(sig00000025)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk00000028 (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000002d),
    .R(sig00000001),
    .Q(sig00000024)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk00000029 (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000002c),
    .R(sig00000001),
    .Q(sig00000023)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk0000002a (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000002b),
    .R(sig00000001),
    .Q(sig00000022)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000005a (
    .C(clk),
    .D(x_in[4]),
    .Q(sig00000003)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000005b (
    .C(clk),
    .D(x_in[5]),
    .Q(sig00000004)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000005c (
    .C(clk),
    .D(x_in[6]),
    .Q(sig00000005)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000005d (
    .C(clk),
    .D(x_in[7]),
    .Q(sig00000006)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk0000005e (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000000e),
    .R(sig00000001),
    .Q(sig00000037)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk0000005f (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000000d),
    .R(sig00000001),
    .Q(sig00000036)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk00000060 (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000000c),
    .R(sig00000001),
    .Q(sig00000035)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk00000061 (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000000b),
    .R(sig00000001),
    .Q(sig00000034)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk00000062 (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000038),
    .R(sig00000001),
    .Q(sig00000033)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk00000063 (
    .C(clk),
    .CE(sig0000003b),
    .D(sig0000003d),
    .R(sig00000001),
    .Q(\U0/i_synth/gen_sqrt.square_root/gen_iterations[5].gen_last.gen_no_round.gen_sqrt_tmp/d_reg<0> )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk00000064 (
    .C(clk),
    .CE(sig0000003b),
    .D(sig0000003e),
    .R(sig00000001),
    .Q(\U0/i_synth/gen_sqrt.square_root/gen_iterations[5].gen_last.gen_no_round.gen_sqrt_tmp/d_reg<1> )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk00000065 (
    .C(clk),
    .CE(sig0000003b),
    .D(sig0000003f),
    .R(sig00000001),
    .Q(\U0/i_synth/gen_sqrt.square_root/gen_iterations[5].gen_last.gen_no_round.gen_sqrt_tmp/d_reg<2> )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk00000066 (
    .C(clk),
    .CE(sig0000003b),
    .D(sig00000040),
    .R(sig00000001),
    .Q(\U0/i_synth/gen_sqrt.square_root/gen_iterations[5].gen_last.gen_no_round.gen_sqrt_tmp/d_reg<3> )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  blk00000067 (
    .C(clk),
    .CE(sig0000003b),
    .D(sig00000041),
    .R(sig00000001),
    .Q(\U0/i_synth/gen_sqrt.square_root/gen_iterations[5].gen_last.gen_no_round.gen_sqrt_tmp/d_reg<4> )
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000068 (
    .C(clk),
    .D(sig00000021),
    .Q(sig00000039)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000069 (
    .C(clk),
    .D(sig00000039),
    .Q(sig0000003a)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000006a (
    .C(clk),
    .D(sig0000003a),
    .Q(sig0000003b)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  blk0000006b (
    .I0(sig00000024),
    .I1(sig00000018),
    .I2(sig00000019),
    .O(sig0000001e)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  blk0000006c (
    .I0(sig00000023),
    .I1(sig00000017),
    .I2(sig00000019),
    .O(sig0000001d)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  blk0000006d (
    .I0(sig00000022),
    .I1(sig00000016),
    .I2(sig00000019),
    .O(sig0000001c)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  blk0000006e (
    .I0(sig0000000a),
    .I1(sig00000015),
    .I2(sig00000019),
    .O(sig0000001b)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  blk0000006f (
    .I0(sig00000009),
    .I1(sig00000014),
    .I2(sig00000019),
    .O(sig0000001a)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk00000070 (
    .I0(sig00000005),
    .I1(sig00000006),
    .O(sig00000043)
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  blk00000071 (
    .I0(sig00000005),
    .I1(sig00000006),
    .O(sig0000003c)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  blk00000072 (
    .I0(sig00000005),
    .I1(sig00000006),
    .O(sig00000042)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  blk00000073 (
    .I0(sig00000043),
    .I1(sig00000029),
    .I2(sig0000002a),
    .O(sig0000002e)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  blk00000074 (
    .I0(sig00000042),
    .I1(sig00000028),
    .I2(sig0000002a),
    .O(sig0000002d)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  blk00000075 (
    .I0(sig00000004),
    .I1(sig00000027),
    .I2(sig0000002a),
    .O(sig0000002c)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  blk00000076 (
    .I0(sig00000003),
    .I1(sig00000026),
    .I2(sig0000002a),
    .O(sig0000002b)
  );
  INV   blk00000077 (
    .I(sig00000037),
    .O(sig00000041)
  );
  INV   blk00000078 (
    .I(sig00000036),
    .O(sig00000040)
  );
  INV   blk00000079 (
    .I(sig00000035),
    .O(sig0000003f)
  );
  INV   blk0000007a (
    .I(sig00000034),
    .O(sig0000003e)
  );
  INV   blk0000007b (
    .I(sig00000033),
    .O(sig0000003d)
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  blk0000007c (
    .A0(sig00000001),
    .A1(sig00000001),
    .A2(sig00000001),
    .A3(sig00000001),
    .CLK(clk),
    .D(x_in[3]),
    .Q(sig00000008)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000007d (
    .C(clk),
    .D(sig00000008),
    .Q(sig0000000a)
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  blk0000007e (
    .A0(sig00000001),
    .A1(sig00000001),
    .A2(sig00000001),
    .A3(sig00000001),
    .CLK(clk),
    .D(x_in[2]),
    .Q(sig00000007)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000007f (
    .C(clk),
    .D(sig00000007),
    .Q(sig00000009)
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  blk00000080 (
    .A0(sig00000002),
    .A1(sig00000001),
    .A2(sig00000001),
    .A3(sig00000001),
    .CLK(clk),
    .D(x_in[1]),
    .Q(sig00000030)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000081 (
    .C(clk),
    .D(sig00000030),
    .Q(sig00000032)
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  blk00000082 (
    .A0(sig00000002),
    .A1(sig00000001),
    .A2(sig00000001),
    .A3(sig00000001),
    .CLK(clk),
    .D(x_in[0]),
    .Q(sig0000002f)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000083 (
    .C(clk),
    .D(sig0000002f),
    .Q(sig00000031)
  );
  INV   \blk0000000c/blk00000023  (
    .I(sig00000009),
    .O(\blk0000000c/sig0000005e )
  );
  INV   \blk0000000c/blk00000022  (
    .I(sig0000000a),
    .O(\blk0000000c/sig0000005f )
  );
  INV   \blk0000000c/blk00000021  (
    .I(sig00000025),
    .O(\blk0000000c/sig00000063 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk0000000c/blk00000020  (
    .I0(sig0000001f),
    .I1(sig00000022),
    .O(\blk0000000c/sig00000060 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk0000000c/blk0000001f  (
    .I0(sig00000020),
    .I1(sig00000023),
    .O(\blk0000000c/sig00000061 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk0000000c/blk0000001e  (
    .I0(sig00000021),
    .I1(sig00000024),
    .O(\blk0000000c/sig00000062 )
  );
  MUXCY   \blk0000000c/blk0000001d  (
    .CI(\blk0000000c/sig0000004e ),
    .DI(sig00000009),
    .S(\blk0000000c/sig0000005e ),
    .O(\blk0000000c/sig00000057 )
  );
  XORCY   \blk0000000c/blk0000001c  (
    .CI(\blk0000000c/sig0000004e ),
    .LI(\blk0000000c/sig0000005e ),
    .O(sig00000014)
  );
  XORCY   \blk0000000c/blk0000001b  (
    .CI(\blk0000000c/sig0000005d ),
    .LI(\blk0000000c/sig00000064 ),
    .O(\blk0000000c/sig00000056 )
  );
  MUXCY   \blk0000000c/blk0000001a  (
    .CI(\blk0000000c/sig00000057 ),
    .DI(sig0000000a),
    .S(\blk0000000c/sig0000005f ),
    .O(\blk0000000c/sig00000058 )
  );
  XORCY   \blk0000000c/blk00000019  (
    .CI(\blk0000000c/sig00000057 ),
    .LI(\blk0000000c/sig0000005f ),
    .O(sig00000015)
  );
  MUXCY   \blk0000000c/blk00000018  (
    .CI(\blk0000000c/sig00000058 ),
    .DI(sig00000022),
    .S(\blk0000000c/sig00000060 ),
    .O(\blk0000000c/sig00000059 )
  );
  XORCY   \blk0000000c/blk00000017  (
    .CI(\blk0000000c/sig00000058 ),
    .LI(\blk0000000c/sig00000060 ),
    .O(sig00000016)
  );
  MUXCY   \blk0000000c/blk00000016  (
    .CI(\blk0000000c/sig00000059 ),
    .DI(sig00000023),
    .S(\blk0000000c/sig00000061 ),
    .O(\blk0000000c/sig0000005a )
  );
  XORCY   \blk0000000c/blk00000015  (
    .CI(\blk0000000c/sig00000059 ),
    .LI(\blk0000000c/sig00000061 ),
    .O(sig00000017)
  );
  MUXCY   \blk0000000c/blk00000014  (
    .CI(\blk0000000c/sig0000005a ),
    .DI(sig00000024),
    .S(\blk0000000c/sig00000062 ),
    .O(\blk0000000c/sig0000005b )
  );
  XORCY   \blk0000000c/blk00000013  (
    .CI(\blk0000000c/sig0000005a ),
    .LI(\blk0000000c/sig00000062 ),
    .O(sig00000018)
  );
  MUXCY   \blk0000000c/blk00000012  (
    .CI(\blk0000000c/sig0000005b ),
    .DI(sig00000025),
    .S(\blk0000000c/sig00000063 ),
    .O(\blk0000000c/sig0000005c )
  );
  XORCY   \blk0000000c/blk00000011  (
    .CI(\blk0000000c/sig0000005b ),
    .LI(\blk0000000c/sig00000063 ),
    .O(\blk0000000c/sig00000054 )
  );
  MUXCY   \blk0000000c/blk00000010  (
    .CI(\blk0000000c/sig0000005c ),
    .DI(sig00000001),
    .S(\blk0000000c/sig00000064 ),
    .O(\blk0000000c/sig0000005d )
  );
  XORCY   \blk0000000c/blk0000000f  (
    .CI(\blk0000000c/sig0000005c ),
    .LI(\blk0000000c/sig00000064 ),
    .O(sig00000019)
  );
  VCC   \blk0000000c/blk0000000e  (
    .P(\blk0000000c/sig00000064 )
  );
  GND   \blk0000000c/blk0000000d  (
    .G(\blk0000000c/sig0000004e )
  );
  INV   \blk0000002b/blk0000003e  (
    .I(sig00000043),
    .O(\blk0000002b/sig0000007d )
  );
  INV   \blk0000002b/blk0000003d  (
    .I(sig00000003),
    .O(\blk0000002b/sig0000007a )
  );
  INV   \blk0000002b/blk0000003c  (
    .I(sig00000004),
    .O(\blk0000002b/sig0000007b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk0000002b/blk0000003b  (
    .I0(sig0000003c),
    .I1(sig00000042),
    .O(\blk0000002b/sig0000007c )
  );
  MUXCY   \blk0000002b/blk0000003a  (
    .CI(\blk0000002b/sig0000006c ),
    .DI(sig00000003),
    .S(\blk0000002b/sig0000007a ),
    .O(\blk0000002b/sig00000074 )
  );
  XORCY   \blk0000002b/blk00000039  (
    .CI(\blk0000002b/sig0000006c ),
    .LI(\blk0000002b/sig0000007a ),
    .O(sig00000026)
  );
  XORCY   \blk0000002b/blk00000038  (
    .CI(\blk0000002b/sig00000079 ),
    .LI(\blk0000002b/sig0000007e ),
    .O(\blk0000002b/sig00000073 )
  );
  MUXCY   \blk0000002b/blk00000037  (
    .CI(\blk0000002b/sig00000074 ),
    .DI(sig00000004),
    .S(\blk0000002b/sig0000007b ),
    .O(\blk0000002b/sig00000075 )
  );
  XORCY   \blk0000002b/blk00000036  (
    .CI(\blk0000002b/sig00000074 ),
    .LI(\blk0000002b/sig0000007b ),
    .O(sig00000027)
  );
  MUXCY   \blk0000002b/blk00000035  (
    .CI(\blk0000002b/sig00000075 ),
    .DI(sig00000042),
    .S(\blk0000002b/sig0000007c ),
    .O(\blk0000002b/sig00000076 )
  );
  XORCY   \blk0000002b/blk00000034  (
    .CI(\blk0000002b/sig00000075 ),
    .LI(\blk0000002b/sig0000007c ),
    .O(sig00000028)
  );
  MUXCY   \blk0000002b/blk00000033  (
    .CI(\blk0000002b/sig00000076 ),
    .DI(sig00000043),
    .S(\blk0000002b/sig0000007d ),
    .O(\blk0000002b/sig00000077 )
  );
  XORCY   \blk0000002b/blk00000032  (
    .CI(\blk0000002b/sig00000076 ),
    .LI(\blk0000002b/sig0000007d ),
    .O(sig00000029)
  );
  MUXCY   \blk0000002b/blk00000031  (
    .CI(\blk0000002b/sig00000077 ),
    .DI(sig00000001),
    .S(\blk0000002b/sig0000007e ),
    .O(\blk0000002b/sig00000078 )
  );
  XORCY   \blk0000002b/blk00000030  (
    .CI(\blk0000002b/sig00000077 ),
    .LI(\blk0000002b/sig0000007e ),
    .O(\blk0000002b/sig00000071 )
  );
  MUXCY   \blk0000002b/blk0000002f  (
    .CI(\blk0000002b/sig00000078 ),
    .DI(sig00000001),
    .S(\blk0000002b/sig0000007e ),
    .O(\blk0000002b/sig00000079 )
  );
  XORCY   \blk0000002b/blk0000002e  (
    .CI(\blk0000002b/sig00000078 ),
    .LI(\blk0000002b/sig0000007e ),
    .O(sig0000002a)
  );
  VCC   \blk0000002b/blk0000002d  (
    .P(\blk0000002b/sig0000007e )
  );
  GND   \blk0000002b/blk0000002c  (
    .G(\blk0000002b/sig0000006c )
  );
  INV   \blk0000003f/blk00000059  (
    .I(sig00000031),
    .O(\blk0000003f/sig0000009d )
  );
  INV   \blk0000003f/blk00000058  (
    .I(sig00000032),
    .O(\blk0000003f/sig0000009e )
  );
  INV   \blk0000003f/blk00000057  (
    .I(sig00000013),
    .O(\blk0000003f/sig000000a3 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk0000003f/blk00000056  (
    .I0(sig0000000b),
    .I1(sig0000000f),
    .O(\blk0000003f/sig0000009f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk0000003f/blk00000055  (
    .I0(sig0000000c),
    .I1(sig00000010),
    .O(\blk0000003f/sig000000a0 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk0000003f/blk00000054  (
    .I0(sig0000000d),
    .I1(sig00000011),
    .O(\blk0000003f/sig000000a1 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk0000003f/blk00000053  (
    .I0(sig0000000e),
    .I1(sig00000012),
    .O(\blk0000003f/sig000000a2 )
  );
  MUXCY   \blk0000003f/blk00000052  (
    .CI(\blk0000003f/sig0000008b ),
    .DI(sig00000031),
    .S(\blk0000003f/sig0000009d ),
    .O(\blk0000003f/sig00000095 )
  );
  XORCY   \blk0000003f/blk00000051  (
    .CI(\blk0000003f/sig0000008b ),
    .LI(\blk0000003f/sig0000009d ),
    .O(\blk0000003f/sig0000008c )
  );
  XORCY   \blk0000003f/blk00000050  (
    .CI(\blk0000003f/sig0000009c ),
    .LI(\blk0000003f/sig000000a4 ),
    .O(\blk0000003f/sig00000094 )
  );
  MUXCY   \blk0000003f/blk0000004f  (
    .CI(\blk0000003f/sig00000095 ),
    .DI(sig00000032),
    .S(\blk0000003f/sig0000009e ),
    .O(\blk0000003f/sig00000096 )
  );
  XORCY   \blk0000003f/blk0000004e  (
    .CI(\blk0000003f/sig00000095 ),
    .LI(\blk0000003f/sig0000009e ),
    .O(\blk0000003f/sig0000008d )
  );
  MUXCY   \blk0000003f/blk0000004d  (
    .CI(\blk0000003f/sig00000096 ),
    .DI(sig0000000f),
    .S(\blk0000003f/sig0000009f ),
    .O(\blk0000003f/sig00000097 )
  );
  XORCY   \blk0000003f/blk0000004c  (
    .CI(\blk0000003f/sig00000096 ),
    .LI(\blk0000003f/sig0000009f ),
    .O(\blk0000003f/sig0000008e )
  );
  MUXCY   \blk0000003f/blk0000004b  (
    .CI(\blk0000003f/sig00000097 ),
    .DI(sig00000010),
    .S(\blk0000003f/sig000000a0 ),
    .O(\blk0000003f/sig00000098 )
  );
  XORCY   \blk0000003f/blk0000004a  (
    .CI(\blk0000003f/sig00000097 ),
    .LI(\blk0000003f/sig000000a0 ),
    .O(\blk0000003f/sig0000008f )
  );
  MUXCY   \blk0000003f/blk00000049  (
    .CI(\blk0000003f/sig00000098 ),
    .DI(sig00000011),
    .S(\blk0000003f/sig000000a1 ),
    .O(\blk0000003f/sig00000099 )
  );
  XORCY   \blk0000003f/blk00000048  (
    .CI(\blk0000003f/sig00000098 ),
    .LI(\blk0000003f/sig000000a1 ),
    .O(\blk0000003f/sig00000090 )
  );
  MUXCY   \blk0000003f/blk00000047  (
    .CI(\blk0000003f/sig00000099 ),
    .DI(sig00000012),
    .S(\blk0000003f/sig000000a2 ),
    .O(\blk0000003f/sig0000009a )
  );
  XORCY   \blk0000003f/blk00000046  (
    .CI(\blk0000003f/sig00000099 ),
    .LI(\blk0000003f/sig000000a2 ),
    .O(\blk0000003f/sig00000091 )
  );
  MUXCY   \blk0000003f/blk00000045  (
    .CI(\blk0000003f/sig0000009a ),
    .DI(sig00000013),
    .S(\blk0000003f/sig000000a3 ),
    .O(\blk0000003f/sig0000009b )
  );
  XORCY   \blk0000003f/blk00000044  (
    .CI(\blk0000003f/sig0000009a ),
    .LI(\blk0000003f/sig000000a3 ),
    .O(\blk0000003f/sig00000092 )
  );
  MUXCY   \blk0000003f/blk00000043  (
    .CI(\blk0000003f/sig0000009b ),
    .DI(sig00000001),
    .S(\blk0000003f/sig000000a4 ),
    .O(\blk0000003f/sig0000009c )
  );
  XORCY   \blk0000003f/blk00000042  (
    .CI(\blk0000003f/sig0000009b ),
    .LI(\blk0000003f/sig000000a4 ),
    .O(sig00000038)
  );
  VCC   \blk0000003f/blk00000041  (
    .P(\blk0000003f/sig000000a4 )
  );
  GND   \blk0000003f/blk00000040  (
    .G(\blk0000003f/sig0000008b )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
