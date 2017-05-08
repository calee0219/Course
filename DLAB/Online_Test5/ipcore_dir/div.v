////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: div.v
// /___/   /\     Timestamp: Sun Jan 08 20:42:02 2017
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog ./tmp/_cg/div.ngc ./tmp/_cg/div.v 
// Device	: 3s500efg320-4
// Input file	: ./tmp/_cg/div.ngc
// Output file	: ./tmp/_cg/div.v
// # of Modules	: 1
// Design Name	: div
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

module div (
  rfd, clk, dividend, quotient, divisor, fractional
)/* synthesis syn_black_box syn_noprune=1 */;
  output rfd;
  input clk;
  input [4 : 0] dividend;
  output [4 : 0] quotient;
  input [4 : 0] divisor;
  output [4 : 0] fractional;
  
  // synthesis translate_off
  
  wire NlwRenamedSig_OI_rfd;
  wire \blk00000003/sig000000ec ;
  wire \blk00000003/sig000000eb ;
  wire \blk00000003/sig000000ea ;
  wire \blk00000003/sig000000e9 ;
  wire \blk00000003/sig000000e8 ;
  wire \blk00000003/sig000000e7 ;
  wire \blk00000003/sig000000e6 ;
  wire \blk00000003/sig000000e5 ;
  wire \blk00000003/sig000000e4 ;
  wire \blk00000003/sig000000e3 ;
  wire \blk00000003/sig000000e2 ;
  wire \blk00000003/sig000000e1 ;
  wire \blk00000003/sig000000e0 ;
  wire \blk00000003/sig000000df ;
  wire \blk00000003/sig000000de ;
  wire \blk00000003/sig000000dd ;
  wire \blk00000003/sig000000dc ;
  wire \blk00000003/sig000000db ;
  wire \blk00000003/sig000000da ;
  wire \blk00000003/sig000000d9 ;
  wire \blk00000003/sig000000d8 ;
  wire \blk00000003/sig000000d7 ;
  wire \blk00000003/sig000000d6 ;
  wire \blk00000003/sig000000d5 ;
  wire \blk00000003/sig000000d4 ;
  wire \blk00000003/sig000000d3 ;
  wire \blk00000003/sig000000d2 ;
  wire \blk00000003/sig000000d1 ;
  wire \blk00000003/sig000000d0 ;
  wire \blk00000003/sig000000cf ;
  wire \blk00000003/sig000000ce ;
  wire \blk00000003/sig000000cd ;
  wire \blk00000003/sig000000cc ;
  wire \blk00000003/sig000000cb ;
  wire \blk00000003/sig000000ca ;
  wire \blk00000003/sig000000c9 ;
  wire \blk00000003/sig000000c8 ;
  wire \blk00000003/sig000000c7 ;
  wire \blk00000003/sig000000c6 ;
  wire \blk00000003/sig000000c5 ;
  wire \blk00000003/sig000000c4 ;
  wire \blk00000003/sig000000c3 ;
  wire \blk00000003/sig000000c2 ;
  wire \blk00000003/sig000000c1 ;
  wire \blk00000003/sig000000c0 ;
  wire \blk00000003/sig000000bf ;
  wire \blk00000003/sig000000be ;
  wire \blk00000003/sig000000bd ;
  wire \blk00000003/sig000000bc ;
  wire \blk00000003/sig000000bb ;
  wire \blk00000003/sig000000ba ;
  wire \blk00000003/sig000000b9 ;
  wire \blk00000003/sig000000b8 ;
  wire \blk00000003/sig000000b7 ;
  wire \blk00000003/sig000000b6 ;
  wire \blk00000003/sig000000b5 ;
  wire \blk00000003/sig000000b4 ;
  wire \blk00000003/sig000000b3 ;
  wire \blk00000003/sig000000b2 ;
  wire \blk00000003/sig000000b1 ;
  wire \blk00000003/sig000000b0 ;
  wire \blk00000003/sig000000af ;
  wire \blk00000003/sig000000ae ;
  wire \blk00000003/sig000000ad ;
  wire \blk00000003/sig000000ac ;
  wire \blk00000003/sig000000ab ;
  wire \blk00000003/sig000000aa ;
  wire \blk00000003/sig000000a9 ;
  wire \blk00000003/sig000000a8 ;
  wire \blk00000003/sig000000a7 ;
  wire \blk00000003/sig000000a6 ;
  wire \blk00000003/sig000000a5 ;
  wire \blk00000003/sig000000a4 ;
  wire \blk00000003/sig000000a3 ;
  wire \blk00000003/sig000000a2 ;
  wire \blk00000003/sig000000a1 ;
  wire \blk00000003/sig000000a0 ;
  wire \blk00000003/sig0000009f ;
  wire \blk00000003/sig0000009e ;
  wire \blk00000003/sig0000009d ;
  wire \blk00000003/sig0000009c ;
  wire \blk00000003/sig0000009b ;
  wire \blk00000003/sig0000009a ;
  wire \blk00000003/sig00000099 ;
  wire \blk00000003/sig00000098 ;
  wire \blk00000003/sig00000097 ;
  wire \blk00000003/sig00000096 ;
  wire \blk00000003/sig00000095 ;
  wire \blk00000003/sig00000094 ;
  wire \blk00000003/sig00000093 ;
  wire \blk00000003/sig00000092 ;
  wire \blk00000003/sig00000091 ;
  wire \blk00000003/sig00000090 ;
  wire \blk00000003/sig0000008f ;
  wire \blk00000003/sig0000008e ;
  wire \blk00000003/sig0000008d ;
  wire \blk00000003/sig0000008c ;
  wire \blk00000003/sig0000008b ;
  wire \blk00000003/sig0000008a ;
  wire \blk00000003/sig00000089 ;
  wire \blk00000003/sig00000088 ;
  wire \blk00000003/sig00000087 ;
  wire \blk00000003/sig00000086 ;
  wire \blk00000003/sig00000085 ;
  wire \blk00000003/sig00000084 ;
  wire \blk00000003/sig00000083 ;
  wire \blk00000003/sig00000082 ;
  wire \blk00000003/sig00000081 ;
  wire \blk00000003/sig00000080 ;
  wire \blk00000003/sig0000007f ;
  wire \blk00000003/sig0000007e ;
  wire \blk00000003/sig0000007d ;
  wire \blk00000003/sig0000007c ;
  wire \blk00000003/sig0000007b ;
  wire \blk00000003/sig0000007a ;
  wire \blk00000003/sig00000079 ;
  wire \blk00000003/sig00000078 ;
  wire \blk00000003/sig00000077 ;
  wire \blk00000003/sig00000076 ;
  wire \blk00000003/sig00000075 ;
  wire \blk00000003/sig00000074 ;
  wire \blk00000003/sig00000073 ;
  wire \blk00000003/sig00000072 ;
  wire \blk00000003/sig00000071 ;
  wire \blk00000003/sig00000070 ;
  wire \blk00000003/sig0000006f ;
  wire \blk00000003/sig0000006e ;
  wire \blk00000003/sig0000006d ;
  wire \blk00000003/sig0000006c ;
  wire \blk00000003/sig0000006b ;
  wire \blk00000003/sig0000006a ;
  wire \blk00000003/sig00000069 ;
  wire \blk00000003/sig00000068 ;
  wire \blk00000003/sig00000067 ;
  wire \blk00000003/sig00000066 ;
  wire \blk00000003/sig00000065 ;
  wire \blk00000003/sig00000064 ;
  wire \blk00000003/sig00000063 ;
  wire \blk00000003/sig00000062 ;
  wire \blk00000003/sig00000061 ;
  wire \blk00000003/sig00000060 ;
  wire \blk00000003/sig0000005f ;
  wire \blk00000003/sig0000005e ;
  wire \blk00000003/sig0000005d ;
  wire \blk00000003/sig0000005c ;
  wire \blk00000003/sig0000005b ;
  wire \blk00000003/sig0000005a ;
  wire \blk00000003/sig00000059 ;
  wire \blk00000003/sig00000058 ;
  wire \blk00000003/sig00000057 ;
  wire \blk00000003/sig00000056 ;
  wire \blk00000003/sig00000055 ;
  wire \blk00000003/sig00000054 ;
  wire \blk00000003/sig00000053 ;
  wire \blk00000003/sig00000052 ;
  wire \blk00000003/sig00000051 ;
  wire \blk00000003/sig00000050 ;
  wire \blk00000003/sig0000004f ;
  wire \blk00000003/sig0000004e ;
  wire \blk00000003/sig0000004d ;
  wire \blk00000003/sig0000004c ;
  wire \blk00000003/sig0000004b ;
  wire \blk00000003/sig0000004a ;
  wire \blk00000003/sig00000049 ;
  wire \blk00000003/sig00000048 ;
  wire \blk00000003/sig00000047 ;
  wire \blk00000003/sig00000046 ;
  wire \blk00000003/sig00000045 ;
  wire \blk00000003/sig00000044 ;
  wire \blk00000003/sig00000043 ;
  wire \blk00000003/sig00000042 ;
  wire \blk00000003/sig00000041 ;
  wire \blk00000003/sig00000040 ;
  wire \blk00000003/sig0000003f ;
  wire \blk00000003/sig0000003e ;
  wire \blk00000003/sig0000003d ;
  wire \blk00000003/sig0000003c ;
  wire \blk00000003/sig0000003b ;
  wire \blk00000003/sig0000003a ;
  wire \blk00000003/sig00000039 ;
  wire \blk00000003/sig00000038 ;
  wire \blk00000003/sig00000037 ;
  wire \blk00000003/sig00000036 ;
  wire \blk00000003/sig00000035 ;
  wire \blk00000003/sig00000034 ;
  wire \blk00000003/sig00000033 ;
  wire \blk00000003/sig00000032 ;
  wire \blk00000003/sig00000031 ;
  wire \blk00000003/sig00000030 ;
  wire \blk00000003/sig0000002f ;
  wire \blk00000003/sig0000002e ;
  wire \blk00000003/sig0000002d ;
  wire \blk00000003/sig0000002c ;
  wire \blk00000003/sig0000002b ;
  wire \blk00000003/sig0000002a ;
  wire \blk00000003/sig00000029 ;
  wire \blk00000003/sig00000028 ;
  wire \blk00000003/sig00000027 ;
  wire \blk00000003/sig00000026 ;
  wire \blk00000003/sig00000025 ;
  wire \blk00000003/sig00000024 ;
  wire \blk00000003/sig00000023 ;
  wire \blk00000003/sig00000022 ;
  wire \blk00000003/sig00000021 ;
  wire \blk00000003/sig00000020 ;
  wire \blk00000003/sig0000001f ;
  wire \blk00000003/sig0000001e ;
  wire \blk00000003/sig0000001d ;
  wire \blk00000003/sig0000001c ;
  wire \blk00000003/sig0000001b ;
  wire \blk00000003/sig0000001a ;
  wire \blk00000003/sig00000019 ;
  wire \blk00000003/sig00000018 ;
  wire \blk00000003/sig00000016 ;
  wire NLW_blk00000001_P_UNCONNECTED;
  wire NLW_blk00000002_G_UNCONNECTED;
  wire [4 : 0] dividend_0;
  wire [4 : 0] divisor_1;
  wire [4 : 0] quotient_2;
  wire [4 : 0] fractional_3;
  assign
    dividend_0[4] = dividend[4],
    dividend_0[3] = dividend[3],
    dividend_0[2] = dividend[2],
    dividend_0[1] = dividend[1],
    dividend_0[0] = dividend[0],
    quotient[4] = quotient_2[4],
    quotient[3] = quotient_2[3],
    quotient[2] = quotient_2[2],
    quotient[1] = quotient_2[1],
    quotient[0] = quotient_2[0],
    divisor_1[4] = divisor[4],
    divisor_1[3] = divisor[3],
    divisor_1[2] = divisor[2],
    divisor_1[1] = divisor[1],
    divisor_1[0] = divisor[0],
    rfd = NlwRenamedSig_OI_rfd,
    fractional[4] = fractional_3[4],
    fractional[3] = fractional_3[3],
    fractional[2] = fractional_3[2],
    fractional[1] = fractional_3[1],
    fractional[0] = fractional_3[0];
  VCC   blk00000001 (
    .P(NLW_blk00000001_P_UNCONNECTED)
  );
  GND   blk00000002 (
    .G(NLW_blk00000002_G_UNCONNECTED)
  );
  INV   \blk00000003/blk000000e4  (
    .I(\blk00000003/sig00000038 ),
    .O(\blk00000003/sig0000005b )
  );
  INV   \blk00000003/blk000000e3  (
    .I(\blk00000003/sig00000037 ),
    .O(\blk00000003/sig0000005e )
  );
  INV   \blk00000003/blk000000e2  (
    .I(\blk00000003/sig00000036 ),
    .O(\blk00000003/sig00000061 )
  );
  INV   \blk00000003/blk000000e1  (
    .I(\blk00000003/sig00000035 ),
    .O(\blk00000003/sig00000064 )
  );
  INV   \blk00000003/blk000000e0  (
    .I(\blk00000003/sig0000001f ),
    .O(\blk00000003/sig00000057 )
  );
  INV   \blk00000003/blk000000df  (
    .I(\blk00000003/sig0000001d ),
    .O(\blk00000003/sig00000056 )
  );
  INV   \blk00000003/blk000000de  (
    .I(\blk00000003/sig0000001b ),
    .O(\blk00000003/sig00000055 )
  );
  INV   \blk00000003/blk000000dd  (
    .I(\blk00000003/sig00000019 ),
    .O(\blk00000003/sig00000054 )
  );
  INV   \blk00000003/blk000000dc  (
    .I(\blk00000003/sig00000018 ),
    .O(\blk00000003/sig000000ca )
  );
  INV   \blk00000003/blk000000db  (
    .I(\blk00000003/sig00000020 ),
    .O(\blk00000003/sig000000b1 )
  );
  INV   \blk00000003/blk000000da  (
    .I(\blk00000003/sig00000027 ),
    .O(\blk00000003/sig00000098 )
  );
  INV   \blk00000003/blk000000d9  (
    .I(\blk00000003/sig0000002d ),
    .O(\blk00000003/sig0000007f )
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \blk00000003/blk000000d8  (
    .I0(\blk00000003/sig000000d1 ),
    .I1(\blk00000003/sig00000051 ),
    .I2(\blk00000003/sig000000d2 ),
    .O(\blk00000003/sig000000d5 )
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \blk00000003/blk000000d7  (
    .I0(\blk00000003/sig000000d0 ),
    .I1(\blk00000003/sig00000050 ),
    .I2(\blk00000003/sig000000d2 ),
    .O(\blk00000003/sig000000da )
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \blk00000003/blk000000d6  (
    .I0(\blk00000003/sig000000cf ),
    .I1(\blk00000003/sig0000004f ),
    .I2(\blk00000003/sig000000d2 ),
    .O(\blk00000003/sig000000de )
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \blk00000003/blk000000d5  (
    .I0(\blk00000003/sig000000ce ),
    .I1(\blk00000003/sig0000004e ),
    .I2(\blk00000003/sig000000d2 ),
    .O(\blk00000003/sig000000e2 )
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \blk00000003/blk000000d4  (
    .I0(\blk00000003/sig000000cd ),
    .I1(\blk00000003/sig0000004d ),
    .I2(\blk00000003/sig000000d2 ),
    .O(\blk00000003/sig000000e8 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk000000d3  (
    .I0(\blk00000003/sig000000b8 ),
    .I1(\blk00000003/sig00000018 ),
    .O(\blk00000003/sig000000bb )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk000000d2  (
    .I0(\blk00000003/sig000000b7 ),
    .I1(\blk00000003/sig0000004c ),
    .I2(\blk00000003/sig00000018 ),
    .O(\blk00000003/sig000000be )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk000000d1  (
    .I0(\blk00000003/sig000000b6 ),
    .I1(\blk00000003/sig0000004b ),
    .I2(\blk00000003/sig00000018 ),
    .O(\blk00000003/sig000000c1 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk000000d0  (
    .I0(\blk00000003/sig000000b5 ),
    .I1(\blk00000003/sig0000004a ),
    .I2(\blk00000003/sig00000018 ),
    .O(\blk00000003/sig000000c4 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk000000cf  (
    .I0(\blk00000003/sig000000b4 ),
    .I1(\blk00000003/sig00000049 ),
    .I2(\blk00000003/sig00000018 ),
    .O(\blk00000003/sig000000c7 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk000000ce  (
    .I0(\blk00000003/sig00000033 ),
    .I1(\blk00000003/sig00000048 ),
    .I2(\blk00000003/sig00000018 ),
    .O(\blk00000003/sig000000cb )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk000000cd  (
    .I0(\blk00000003/sig0000009f ),
    .I1(\blk00000003/sig00000020 ),
    .O(\blk00000003/sig000000a2 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk000000cc  (
    .I0(\blk00000003/sig0000009e ),
    .I1(\blk00000003/sig00000047 ),
    .I2(\blk00000003/sig00000020 ),
    .O(\blk00000003/sig000000a5 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk000000cb  (
    .I0(\blk00000003/sig0000009d ),
    .I1(\blk00000003/sig00000046 ),
    .I2(\blk00000003/sig00000020 ),
    .O(\blk00000003/sig000000a8 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk000000ca  (
    .I0(\blk00000003/sig0000009c ),
    .I1(\blk00000003/sig00000045 ),
    .I2(\blk00000003/sig00000020 ),
    .O(\blk00000003/sig000000ab )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk000000c9  (
    .I0(\blk00000003/sig0000009b ),
    .I1(\blk00000003/sig00000044 ),
    .I2(\blk00000003/sig00000020 ),
    .O(\blk00000003/sig000000ae )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk000000c8  (
    .I0(\blk00000003/sig00000026 ),
    .I1(\blk00000003/sig00000043 ),
    .I2(\blk00000003/sig00000020 ),
    .O(\blk00000003/sig000000b2 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk000000c7  (
    .I0(\blk00000003/sig00000086 ),
    .I1(\blk00000003/sig00000027 ),
    .O(\blk00000003/sig00000089 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk000000c6  (
    .I0(\blk00000003/sig00000085 ),
    .I1(\blk00000003/sig00000042 ),
    .I2(\blk00000003/sig00000027 ),
    .O(\blk00000003/sig0000008c )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk000000c5  (
    .I0(\blk00000003/sig00000084 ),
    .I1(\blk00000003/sig00000041 ),
    .I2(\blk00000003/sig00000027 ),
    .O(\blk00000003/sig0000008f )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk000000c4  (
    .I0(\blk00000003/sig00000083 ),
    .I1(\blk00000003/sig00000040 ),
    .I2(\blk00000003/sig00000027 ),
    .O(\blk00000003/sig00000092 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk000000c3  (
    .I0(\blk00000003/sig00000082 ),
    .I1(\blk00000003/sig0000003f ),
    .I2(\blk00000003/sig00000027 ),
    .O(\blk00000003/sig00000095 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk000000c2  (
    .I0(\blk00000003/sig0000002c ),
    .I1(\blk00000003/sig0000003e ),
    .I2(\blk00000003/sig00000027 ),
    .O(\blk00000003/sig00000099 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk000000c1  (
    .I0(\blk00000003/sig0000006d ),
    .I1(\blk00000003/sig0000002d ),
    .O(\blk00000003/sig00000070 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk000000c0  (
    .I0(\blk00000003/sig0000006c ),
    .I1(\blk00000003/sig0000003d ),
    .I2(\blk00000003/sig0000002d ),
    .O(\blk00000003/sig00000073 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk000000bf  (
    .I0(\blk00000003/sig0000006b ),
    .I1(\blk00000003/sig0000003c ),
    .I2(\blk00000003/sig0000002d ),
    .O(\blk00000003/sig00000076 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk000000be  (
    .I0(\blk00000003/sig0000006a ),
    .I1(\blk00000003/sig0000003b ),
    .I2(\blk00000003/sig0000002d ),
    .O(\blk00000003/sig00000079 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk000000bd  (
    .I0(\blk00000003/sig00000069 ),
    .I1(\blk00000003/sig0000003a ),
    .I2(\blk00000003/sig0000002d ),
    .O(\blk00000003/sig0000007c )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000003/blk000000bc  (
    .I0(\blk00000003/sig00000032 ),
    .I1(\blk00000003/sig00000039 ),
    .I2(\blk00000003/sig0000002d ),
    .O(\blk00000003/sig00000080 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk000000bb  (
    .I0(\blk00000003/sig00000052 ),
    .I1(\blk00000003/sig00000034 ),
    .O(\blk00000003/sig00000067 )
  );
  LUT1 #(
    .INIT ( 2'h1 ))
  \blk00000003/blk000000ba  (
    .I0(\blk00000003/sig000000d2 ),
    .O(\blk00000003/sig00000053 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000b9  (
    .C(clk),
    .D(\blk00000003/sig000000e6 ),
    .Q(\blk00000003/sig000000ec )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000b8  (
    .C(clk),
    .D(\blk00000003/sig000000e7 ),
    .Q(\blk00000003/sig000000eb )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000b7  (
    .C(clk),
    .D(\blk00000003/sig000000d6 ),
    .Q(fractional_3[4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000b6  (
    .C(clk),
    .D(\blk00000003/sig000000db ),
    .Q(fractional_3[3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000b5  (
    .C(clk),
    .D(\blk00000003/sig000000df ),
    .Q(fractional_3[2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000b4  (
    .C(clk),
    .D(\blk00000003/sig000000e3 ),
    .Q(fractional_3[1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000b3  (
    .C(clk),
    .D(\blk00000003/sig000000e9 ),
    .Q(fractional_3[0])
  );
  MULT_AND   \blk00000003/blk000000b2  (
    .I0(\blk00000003/sig0000004d ),
    .I1(\blk00000003/sig000000d2 ),
    .LO(\blk00000003/sig000000ea )
  );
  MULT_AND   \blk00000003/blk000000b1  (
    .I0(\blk00000003/sig0000004e ),
    .I1(\blk00000003/sig000000d2 ),
    .LO(\blk00000003/sig000000e4 )
  );
  MULT_AND   \blk00000003/blk000000b0  (
    .I0(\blk00000003/sig0000004f ),
    .I1(\blk00000003/sig000000d2 ),
    .LO(\blk00000003/sig000000e0 )
  );
  MULT_AND   \blk00000003/blk000000af  (
    .I0(\blk00000003/sig00000050 ),
    .I1(\blk00000003/sig000000d2 ),
    .LO(\blk00000003/sig000000dc )
  );
  MULT_AND   \blk00000003/blk000000ae  (
    .I0(\blk00000003/sig00000051 ),
    .I1(\blk00000003/sig000000d2 ),
    .LO(\blk00000003/sig000000d7 )
  );
  MULT_AND   \blk00000003/blk000000ad  (
    .I0(\blk00000003/sig00000016 ),
    .I1(\blk00000003/sig000000d2 ),
    .LO(\blk00000003/sig000000e5 )
  );
  MUXCY   \blk00000003/blk000000ac  (
    .CI(\blk00000003/sig00000016 ),
    .DI(\blk00000003/sig000000ea ),
    .S(\blk00000003/sig000000e8 ),
    .O(\blk00000003/sig000000e1 )
  );
  XORCY   \blk00000003/blk000000ab  (
    .CI(\blk00000003/sig00000016 ),
    .LI(\blk00000003/sig000000e8 ),
    .O(\blk00000003/sig000000e9 )
  );
  XORCY   \blk00000003/blk000000aa  (
    .CI(\blk00000003/sig000000d8 ),
    .LI(\blk00000003/sig00000016 ),
    .O(\blk00000003/sig000000e7 )
  );
  MUXCY   \blk00000003/blk000000a9  (
    .CI(\blk00000003/sig000000d8 ),
    .DI(\blk00000003/sig000000e5 ),
    .S(\blk00000003/sig00000016 ),
    .O(\blk00000003/sig000000e6 )
  );
  MUXCY   \blk00000003/blk000000a8  (
    .CI(\blk00000003/sig000000e1 ),
    .DI(\blk00000003/sig000000e4 ),
    .S(\blk00000003/sig000000e2 ),
    .O(\blk00000003/sig000000dd )
  );
  XORCY   \blk00000003/blk000000a7  (
    .CI(\blk00000003/sig000000e1 ),
    .LI(\blk00000003/sig000000e2 ),
    .O(\blk00000003/sig000000e3 )
  );
  MUXCY   \blk00000003/blk000000a6  (
    .CI(\blk00000003/sig000000dd ),
    .DI(\blk00000003/sig000000e0 ),
    .S(\blk00000003/sig000000de ),
    .O(\blk00000003/sig000000d9 )
  );
  XORCY   \blk00000003/blk000000a5  (
    .CI(\blk00000003/sig000000dd ),
    .LI(\blk00000003/sig000000de ),
    .O(\blk00000003/sig000000df )
  );
  MUXCY   \blk00000003/blk000000a4  (
    .CI(\blk00000003/sig000000d9 ),
    .DI(\blk00000003/sig000000dc ),
    .S(\blk00000003/sig000000da ),
    .O(\blk00000003/sig000000d4 )
  );
  XORCY   \blk00000003/blk000000a3  (
    .CI(\blk00000003/sig000000d9 ),
    .LI(\blk00000003/sig000000da ),
    .O(\blk00000003/sig000000db )
  );
  MUXCY   \blk00000003/blk000000a2  (
    .CI(\blk00000003/sig000000d4 ),
    .DI(\blk00000003/sig000000d7 ),
    .S(\blk00000003/sig000000d5 ),
    .O(\blk00000003/sig000000d8 )
  );
  XORCY   \blk00000003/blk000000a1  (
    .CI(\blk00000003/sig000000d4 ),
    .LI(\blk00000003/sig000000d5 ),
    .O(\blk00000003/sig000000d6 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk000000a0  (
    .C(clk),
    .D(\blk00000003/sig000000c9 ),
    .Q(\blk00000003/sig000000d3 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000009f  (
    .C(clk),
    .D(\blk00000003/sig000000bc ),
    .Q(\blk00000003/sig000000d2 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000009e  (
    .C(clk),
    .D(\blk00000003/sig000000bf ),
    .Q(\blk00000003/sig000000d1 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000009d  (
    .C(clk),
    .D(\blk00000003/sig000000c2 ),
    .Q(\blk00000003/sig000000d0 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000009c  (
    .C(clk),
    .D(\blk00000003/sig000000c5 ),
    .Q(\blk00000003/sig000000cf )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000009b  (
    .C(clk),
    .D(\blk00000003/sig000000c8 ),
    .Q(\blk00000003/sig000000ce )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000009a  (
    .C(clk),
    .D(\blk00000003/sig000000cc ),
    .Q(\blk00000003/sig000000cd )
  );
  MUXCY   \blk00000003/blk00000099  (
    .CI(\blk00000003/sig000000ca ),
    .DI(\blk00000003/sig00000033 ),
    .S(\blk00000003/sig000000cb ),
    .O(\blk00000003/sig000000c6 )
  );
  XORCY   \blk00000003/blk00000098  (
    .CI(\blk00000003/sig000000ca ),
    .LI(\blk00000003/sig000000cb ),
    .O(\blk00000003/sig000000cc )
  );
  MUXCY   \blk00000003/blk00000097  (
    .CI(\blk00000003/sig000000ba ),
    .DI(\blk00000003/sig000000b8 ),
    .S(\blk00000003/sig000000bb ),
    .O(\blk00000003/sig000000c9 )
  );
  MUXCY   \blk00000003/blk00000096  (
    .CI(\blk00000003/sig000000c6 ),
    .DI(\blk00000003/sig000000b4 ),
    .S(\blk00000003/sig000000c7 ),
    .O(\blk00000003/sig000000c3 )
  );
  MUXCY   \blk00000003/blk00000095  (
    .CI(\blk00000003/sig000000c3 ),
    .DI(\blk00000003/sig000000b5 ),
    .S(\blk00000003/sig000000c4 ),
    .O(\blk00000003/sig000000c0 )
  );
  MUXCY   \blk00000003/blk00000094  (
    .CI(\blk00000003/sig000000c0 ),
    .DI(\blk00000003/sig000000b6 ),
    .S(\blk00000003/sig000000c1 ),
    .O(\blk00000003/sig000000bd )
  );
  MUXCY   \blk00000003/blk00000093  (
    .CI(\blk00000003/sig000000bd ),
    .DI(\blk00000003/sig000000b7 ),
    .S(\blk00000003/sig000000be ),
    .O(\blk00000003/sig000000ba )
  );
  XORCY   \blk00000003/blk00000092  (
    .CI(\blk00000003/sig000000c6 ),
    .LI(\blk00000003/sig000000c7 ),
    .O(\blk00000003/sig000000c8 )
  );
  XORCY   \blk00000003/blk00000091  (
    .CI(\blk00000003/sig000000c3 ),
    .LI(\blk00000003/sig000000c4 ),
    .O(\blk00000003/sig000000c5 )
  );
  XORCY   \blk00000003/blk00000090  (
    .CI(\blk00000003/sig000000c0 ),
    .LI(\blk00000003/sig000000c1 ),
    .O(\blk00000003/sig000000c2 )
  );
  XORCY   \blk00000003/blk0000008f  (
    .CI(\blk00000003/sig000000bd ),
    .LI(\blk00000003/sig000000be ),
    .O(\blk00000003/sig000000bf )
  );
  XORCY   \blk00000003/blk0000008e  (
    .CI(\blk00000003/sig000000ba ),
    .LI(\blk00000003/sig000000bb ),
    .O(\blk00000003/sig000000bc )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000008d  (
    .C(clk),
    .D(\blk00000003/sig000000b0 ),
    .Q(\blk00000003/sig000000b9 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000008c  (
    .C(clk),
    .D(\blk00000003/sig000000a3 ),
    .Q(\blk00000003/sig00000018 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000008b  (
    .C(clk),
    .D(\blk00000003/sig000000a6 ),
    .Q(\blk00000003/sig000000b8 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000008a  (
    .C(clk),
    .D(\blk00000003/sig000000a9 ),
    .Q(\blk00000003/sig000000b7 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000089  (
    .C(clk),
    .D(\blk00000003/sig000000ac ),
    .Q(\blk00000003/sig000000b6 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000088  (
    .C(clk),
    .D(\blk00000003/sig000000af ),
    .Q(\blk00000003/sig000000b5 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000087  (
    .C(clk),
    .D(\blk00000003/sig000000b3 ),
    .Q(\blk00000003/sig000000b4 )
  );
  MUXCY   \blk00000003/blk00000086  (
    .CI(\blk00000003/sig000000b1 ),
    .DI(\blk00000003/sig00000026 ),
    .S(\blk00000003/sig000000b2 ),
    .O(\blk00000003/sig000000ad )
  );
  XORCY   \blk00000003/blk00000085  (
    .CI(\blk00000003/sig000000b1 ),
    .LI(\blk00000003/sig000000b2 ),
    .O(\blk00000003/sig000000b3 )
  );
  MUXCY   \blk00000003/blk00000084  (
    .CI(\blk00000003/sig000000a1 ),
    .DI(\blk00000003/sig0000009f ),
    .S(\blk00000003/sig000000a2 ),
    .O(\blk00000003/sig000000b0 )
  );
  MUXCY   \blk00000003/blk00000083  (
    .CI(\blk00000003/sig000000ad ),
    .DI(\blk00000003/sig0000009b ),
    .S(\blk00000003/sig000000ae ),
    .O(\blk00000003/sig000000aa )
  );
  MUXCY   \blk00000003/blk00000082  (
    .CI(\blk00000003/sig000000aa ),
    .DI(\blk00000003/sig0000009c ),
    .S(\blk00000003/sig000000ab ),
    .O(\blk00000003/sig000000a7 )
  );
  MUXCY   \blk00000003/blk00000081  (
    .CI(\blk00000003/sig000000a7 ),
    .DI(\blk00000003/sig0000009d ),
    .S(\blk00000003/sig000000a8 ),
    .O(\blk00000003/sig000000a4 )
  );
  MUXCY   \blk00000003/blk00000080  (
    .CI(\blk00000003/sig000000a4 ),
    .DI(\blk00000003/sig0000009e ),
    .S(\blk00000003/sig000000a5 ),
    .O(\blk00000003/sig000000a1 )
  );
  XORCY   \blk00000003/blk0000007f  (
    .CI(\blk00000003/sig000000ad ),
    .LI(\blk00000003/sig000000ae ),
    .O(\blk00000003/sig000000af )
  );
  XORCY   \blk00000003/blk0000007e  (
    .CI(\blk00000003/sig000000aa ),
    .LI(\blk00000003/sig000000ab ),
    .O(\blk00000003/sig000000ac )
  );
  XORCY   \blk00000003/blk0000007d  (
    .CI(\blk00000003/sig000000a7 ),
    .LI(\blk00000003/sig000000a8 ),
    .O(\blk00000003/sig000000a9 )
  );
  XORCY   \blk00000003/blk0000007c  (
    .CI(\blk00000003/sig000000a4 ),
    .LI(\blk00000003/sig000000a5 ),
    .O(\blk00000003/sig000000a6 )
  );
  XORCY   \blk00000003/blk0000007b  (
    .CI(\blk00000003/sig000000a1 ),
    .LI(\blk00000003/sig000000a2 ),
    .O(\blk00000003/sig000000a3 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000007a  (
    .C(clk),
    .D(\blk00000003/sig00000097 ),
    .Q(\blk00000003/sig000000a0 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000079  (
    .C(clk),
    .D(\blk00000003/sig0000008a ),
    .Q(\blk00000003/sig00000020 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000078  (
    .C(clk),
    .D(\blk00000003/sig0000008d ),
    .Q(\blk00000003/sig0000009f )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000077  (
    .C(clk),
    .D(\blk00000003/sig00000090 ),
    .Q(\blk00000003/sig0000009e )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000076  (
    .C(clk),
    .D(\blk00000003/sig00000093 ),
    .Q(\blk00000003/sig0000009d )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000075  (
    .C(clk),
    .D(\blk00000003/sig00000096 ),
    .Q(\blk00000003/sig0000009c )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000074  (
    .C(clk),
    .D(\blk00000003/sig0000009a ),
    .Q(\blk00000003/sig0000009b )
  );
  MUXCY   \blk00000003/blk00000073  (
    .CI(\blk00000003/sig00000098 ),
    .DI(\blk00000003/sig0000002c ),
    .S(\blk00000003/sig00000099 ),
    .O(\blk00000003/sig00000094 )
  );
  XORCY   \blk00000003/blk00000072  (
    .CI(\blk00000003/sig00000098 ),
    .LI(\blk00000003/sig00000099 ),
    .O(\blk00000003/sig0000009a )
  );
  MUXCY   \blk00000003/blk00000071  (
    .CI(\blk00000003/sig00000088 ),
    .DI(\blk00000003/sig00000086 ),
    .S(\blk00000003/sig00000089 ),
    .O(\blk00000003/sig00000097 )
  );
  MUXCY   \blk00000003/blk00000070  (
    .CI(\blk00000003/sig00000094 ),
    .DI(\blk00000003/sig00000082 ),
    .S(\blk00000003/sig00000095 ),
    .O(\blk00000003/sig00000091 )
  );
  MUXCY   \blk00000003/blk0000006f  (
    .CI(\blk00000003/sig00000091 ),
    .DI(\blk00000003/sig00000083 ),
    .S(\blk00000003/sig00000092 ),
    .O(\blk00000003/sig0000008e )
  );
  MUXCY   \blk00000003/blk0000006e  (
    .CI(\blk00000003/sig0000008e ),
    .DI(\blk00000003/sig00000084 ),
    .S(\blk00000003/sig0000008f ),
    .O(\blk00000003/sig0000008b )
  );
  MUXCY   \blk00000003/blk0000006d  (
    .CI(\blk00000003/sig0000008b ),
    .DI(\blk00000003/sig00000085 ),
    .S(\blk00000003/sig0000008c ),
    .O(\blk00000003/sig00000088 )
  );
  XORCY   \blk00000003/blk0000006c  (
    .CI(\blk00000003/sig00000094 ),
    .LI(\blk00000003/sig00000095 ),
    .O(\blk00000003/sig00000096 )
  );
  XORCY   \blk00000003/blk0000006b  (
    .CI(\blk00000003/sig00000091 ),
    .LI(\blk00000003/sig00000092 ),
    .O(\blk00000003/sig00000093 )
  );
  XORCY   \blk00000003/blk0000006a  (
    .CI(\blk00000003/sig0000008e ),
    .LI(\blk00000003/sig0000008f ),
    .O(\blk00000003/sig00000090 )
  );
  XORCY   \blk00000003/blk00000069  (
    .CI(\blk00000003/sig0000008b ),
    .LI(\blk00000003/sig0000008c ),
    .O(\blk00000003/sig0000008d )
  );
  XORCY   \blk00000003/blk00000068  (
    .CI(\blk00000003/sig00000088 ),
    .LI(\blk00000003/sig00000089 ),
    .O(\blk00000003/sig0000008a )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000067  (
    .C(clk),
    .D(\blk00000003/sig0000007e ),
    .Q(\blk00000003/sig00000087 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000066  (
    .C(clk),
    .D(\blk00000003/sig00000071 ),
    .Q(\blk00000003/sig00000027 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000065  (
    .C(clk),
    .D(\blk00000003/sig00000074 ),
    .Q(\blk00000003/sig00000086 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000064  (
    .C(clk),
    .D(\blk00000003/sig00000077 ),
    .Q(\blk00000003/sig00000085 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000063  (
    .C(clk),
    .D(\blk00000003/sig0000007a ),
    .Q(\blk00000003/sig00000084 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000062  (
    .C(clk),
    .D(\blk00000003/sig0000007d ),
    .Q(\blk00000003/sig00000083 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000061  (
    .C(clk),
    .D(\blk00000003/sig00000081 ),
    .Q(\blk00000003/sig00000082 )
  );
  MUXCY   \blk00000003/blk00000060  (
    .CI(\blk00000003/sig0000007f ),
    .DI(\blk00000003/sig00000032 ),
    .S(\blk00000003/sig00000080 ),
    .O(\blk00000003/sig0000007b )
  );
  XORCY   \blk00000003/blk0000005f  (
    .CI(\blk00000003/sig0000007f ),
    .LI(\blk00000003/sig00000080 ),
    .O(\blk00000003/sig00000081 )
  );
  MUXCY   \blk00000003/blk0000005e  (
    .CI(\blk00000003/sig0000006f ),
    .DI(\blk00000003/sig0000006d ),
    .S(\blk00000003/sig00000070 ),
    .O(\blk00000003/sig0000007e )
  );
  MUXCY   \blk00000003/blk0000005d  (
    .CI(\blk00000003/sig0000007b ),
    .DI(\blk00000003/sig00000069 ),
    .S(\blk00000003/sig0000007c ),
    .O(\blk00000003/sig00000078 )
  );
  MUXCY   \blk00000003/blk0000005c  (
    .CI(\blk00000003/sig00000078 ),
    .DI(\blk00000003/sig0000006a ),
    .S(\blk00000003/sig00000079 ),
    .O(\blk00000003/sig00000075 )
  );
  MUXCY   \blk00000003/blk0000005b  (
    .CI(\blk00000003/sig00000075 ),
    .DI(\blk00000003/sig0000006b ),
    .S(\blk00000003/sig00000076 ),
    .O(\blk00000003/sig00000072 )
  );
  MUXCY   \blk00000003/blk0000005a  (
    .CI(\blk00000003/sig00000072 ),
    .DI(\blk00000003/sig0000006c ),
    .S(\blk00000003/sig00000073 ),
    .O(\blk00000003/sig0000006f )
  );
  XORCY   \blk00000003/blk00000059  (
    .CI(\blk00000003/sig0000007b ),
    .LI(\blk00000003/sig0000007c ),
    .O(\blk00000003/sig0000007d )
  );
  XORCY   \blk00000003/blk00000058  (
    .CI(\blk00000003/sig00000078 ),
    .LI(\blk00000003/sig00000079 ),
    .O(\blk00000003/sig0000007a )
  );
  XORCY   \blk00000003/blk00000057  (
    .CI(\blk00000003/sig00000075 ),
    .LI(\blk00000003/sig00000076 ),
    .O(\blk00000003/sig00000077 )
  );
  XORCY   \blk00000003/blk00000056  (
    .CI(\blk00000003/sig00000072 ),
    .LI(\blk00000003/sig00000073 ),
    .O(\blk00000003/sig00000074 )
  );
  XORCY   \blk00000003/blk00000055  (
    .CI(\blk00000003/sig0000006f ),
    .LI(\blk00000003/sig00000070 ),
    .O(\blk00000003/sig00000071 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000054  (
    .C(clk),
    .D(\blk00000003/sig00000066 ),
    .Q(\blk00000003/sig0000006e )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000053  (
    .C(clk),
    .D(\blk00000003/sig00000059 ),
    .Q(\blk00000003/sig0000002d )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000052  (
    .C(clk),
    .D(\blk00000003/sig0000005c ),
    .Q(\blk00000003/sig0000006d )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000051  (
    .C(clk),
    .D(\blk00000003/sig0000005f ),
    .Q(\blk00000003/sig0000006c )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000050  (
    .C(clk),
    .D(\blk00000003/sig00000062 ),
    .Q(\blk00000003/sig0000006b )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000004f  (
    .C(clk),
    .D(\blk00000003/sig00000065 ),
    .Q(\blk00000003/sig0000006a )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000004e  (
    .C(clk),
    .D(\blk00000003/sig00000068 ),
    .Q(\blk00000003/sig00000069 )
  );
  MUXCY   \blk00000003/blk0000004d  (
    .CI(NlwRenamedSig_OI_rfd),
    .DI(\blk00000003/sig00000052 ),
    .S(\blk00000003/sig00000067 ),
    .O(\blk00000003/sig00000063 )
  );
  XORCY   \blk00000003/blk0000004c  (
    .CI(NlwRenamedSig_OI_rfd),
    .LI(\blk00000003/sig00000067 ),
    .O(\blk00000003/sig00000068 )
  );
  MUXCY   \blk00000003/blk0000004b  (
    .CI(\blk00000003/sig00000058 ),
    .DI(\blk00000003/sig00000016 ),
    .S(NlwRenamedSig_OI_rfd),
    .O(\blk00000003/sig00000066 )
  );
  MUXCY   \blk00000003/blk0000004a  (
    .CI(\blk00000003/sig00000063 ),
    .DI(\blk00000003/sig00000016 ),
    .S(\blk00000003/sig00000064 ),
    .O(\blk00000003/sig00000060 )
  );
  MUXCY   \blk00000003/blk00000049  (
    .CI(\blk00000003/sig00000060 ),
    .DI(\blk00000003/sig00000016 ),
    .S(\blk00000003/sig00000061 ),
    .O(\blk00000003/sig0000005d )
  );
  MUXCY   \blk00000003/blk00000048  (
    .CI(\blk00000003/sig0000005d ),
    .DI(\blk00000003/sig00000016 ),
    .S(\blk00000003/sig0000005e ),
    .O(\blk00000003/sig0000005a )
  );
  MUXCY   \blk00000003/blk00000047  (
    .CI(\blk00000003/sig0000005a ),
    .DI(\blk00000003/sig00000016 ),
    .S(\blk00000003/sig0000005b ),
    .O(\blk00000003/sig00000058 )
  );
  XORCY   \blk00000003/blk00000046  (
    .CI(\blk00000003/sig00000063 ),
    .LI(\blk00000003/sig00000064 ),
    .O(\blk00000003/sig00000065 )
  );
  XORCY   \blk00000003/blk00000045  (
    .CI(\blk00000003/sig00000060 ),
    .LI(\blk00000003/sig00000061 ),
    .O(\blk00000003/sig00000062 )
  );
  XORCY   \blk00000003/blk00000044  (
    .CI(\blk00000003/sig0000005d ),
    .LI(\blk00000003/sig0000005e ),
    .O(\blk00000003/sig0000005f )
  );
  XORCY   \blk00000003/blk00000043  (
    .CI(\blk00000003/sig0000005a ),
    .LI(\blk00000003/sig0000005b ),
    .O(\blk00000003/sig0000005c )
  );
  XORCY   \blk00000003/blk00000042  (
    .CI(\blk00000003/sig00000058 ),
    .LI(NlwRenamedSig_OI_rfd),
    .O(\blk00000003/sig00000059 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000041  (
    .C(clk),
    .D(\blk00000003/sig00000057 ),
    .Q(quotient_2[4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000040  (
    .C(clk),
    .D(\blk00000003/sig00000056 ),
    .Q(quotient_2[3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000003f  (
    .C(clk),
    .D(\blk00000003/sig00000055 ),
    .Q(quotient_2[2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000003e  (
    .C(clk),
    .D(\blk00000003/sig00000054 ),
    .Q(quotient_2[1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000003d  (
    .C(clk),
    .D(\blk00000003/sig00000053 ),
    .Q(quotient_2[0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000003c  (
    .C(clk),
    .D(dividend_0[4]),
    .Q(\blk00000003/sig00000052 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000003b  (
    .C(clk),
    .D(dividend_0[3]),
    .Q(\blk00000003/sig00000031 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000003a  (
    .C(clk),
    .D(dividend_0[2]),
    .Q(\blk00000003/sig00000030 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000039  (
    .C(clk),
    .D(dividend_0[1]),
    .Q(\blk00000003/sig0000002f )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000038  (
    .C(clk),
    .D(dividend_0[0]),
    .Q(\blk00000003/sig0000002e )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000037  (
    .C(clk),
    .D(\blk00000003/sig0000004c ),
    .Q(\blk00000003/sig00000051 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000036  (
    .C(clk),
    .D(\blk00000003/sig0000004b ),
    .Q(\blk00000003/sig00000050 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000035  (
    .C(clk),
    .D(\blk00000003/sig0000004a ),
    .Q(\blk00000003/sig0000004f )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000034  (
    .C(clk),
    .D(\blk00000003/sig00000049 ),
    .Q(\blk00000003/sig0000004e )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000033  (
    .C(clk),
    .D(\blk00000003/sig00000048 ),
    .Q(\blk00000003/sig0000004d )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000032  (
    .C(clk),
    .D(\blk00000003/sig00000047 ),
    .Q(\blk00000003/sig0000004c )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000031  (
    .C(clk),
    .D(\blk00000003/sig00000046 ),
    .Q(\blk00000003/sig0000004b )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000030  (
    .C(clk),
    .D(\blk00000003/sig00000045 ),
    .Q(\blk00000003/sig0000004a )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000002f  (
    .C(clk),
    .D(\blk00000003/sig00000044 ),
    .Q(\blk00000003/sig00000049 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000002e  (
    .C(clk),
    .D(\blk00000003/sig00000043 ),
    .Q(\blk00000003/sig00000048 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000002d  (
    .C(clk),
    .D(\blk00000003/sig00000042 ),
    .Q(\blk00000003/sig00000047 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000002c  (
    .C(clk),
    .D(\blk00000003/sig00000041 ),
    .Q(\blk00000003/sig00000046 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000002b  (
    .C(clk),
    .D(\blk00000003/sig00000040 ),
    .Q(\blk00000003/sig00000045 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000002a  (
    .C(clk),
    .D(\blk00000003/sig0000003f ),
    .Q(\blk00000003/sig00000044 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000029  (
    .C(clk),
    .D(\blk00000003/sig0000003e ),
    .Q(\blk00000003/sig00000043 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000028  (
    .C(clk),
    .D(\blk00000003/sig0000003d ),
    .Q(\blk00000003/sig00000042 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000027  (
    .C(clk),
    .D(\blk00000003/sig0000003c ),
    .Q(\blk00000003/sig00000041 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000026  (
    .C(clk),
    .D(\blk00000003/sig0000003b ),
    .Q(\blk00000003/sig00000040 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000025  (
    .C(clk),
    .D(\blk00000003/sig0000003a ),
    .Q(\blk00000003/sig0000003f )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000024  (
    .C(clk),
    .D(\blk00000003/sig00000039 ),
    .Q(\blk00000003/sig0000003e )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000023  (
    .C(clk),
    .D(\blk00000003/sig00000038 ),
    .Q(\blk00000003/sig0000003d )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000022  (
    .C(clk),
    .D(\blk00000003/sig00000037 ),
    .Q(\blk00000003/sig0000003c )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000021  (
    .C(clk),
    .D(\blk00000003/sig00000036 ),
    .Q(\blk00000003/sig0000003b )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000020  (
    .C(clk),
    .D(\blk00000003/sig00000035 ),
    .Q(\blk00000003/sig0000003a )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000001f  (
    .C(clk),
    .D(\blk00000003/sig00000034 ),
    .Q(\blk00000003/sig00000039 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000001e  (
    .C(clk),
    .D(divisor_1[4]),
    .Q(\blk00000003/sig00000038 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000001d  (
    .C(clk),
    .D(divisor_1[3]),
    .Q(\blk00000003/sig00000037 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000001c  (
    .C(clk),
    .D(divisor_1[2]),
    .Q(\blk00000003/sig00000036 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000001b  (
    .C(clk),
    .D(divisor_1[1]),
    .Q(\blk00000003/sig00000035 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000001a  (
    .C(clk),
    .D(divisor_1[0]),
    .Q(\blk00000003/sig00000034 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000019  (
    .C(clk),
    .D(\blk00000003/sig00000024 ),
    .Q(\blk00000003/sig00000033 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000018  (
    .C(clk),
    .D(\blk00000003/sig00000031 ),
    .Q(\blk00000003/sig00000032 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000017  (
    .C(clk),
    .D(\blk00000003/sig00000030 ),
    .Q(\blk00000003/sig0000002b )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000016  (
    .C(clk),
    .D(\blk00000003/sig0000002f ),
    .Q(\blk00000003/sig0000002a )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000015  (
    .C(clk),
    .D(\blk00000003/sig0000002e ),
    .Q(\blk00000003/sig00000029 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000014  (
    .C(clk),
    .D(\blk00000003/sig0000002d ),
    .Q(\blk00000003/sig00000028 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000013  (
    .C(clk),
    .D(\blk00000003/sig0000002b ),
    .Q(\blk00000003/sig0000002c )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000012  (
    .C(clk),
    .D(\blk00000003/sig0000002a ),
    .Q(\blk00000003/sig00000025 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk00000011  (
    .C(clk),
    .D(\blk00000003/sig00000029 ),
    .Q(\blk00000003/sig00000023 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000010  (
    .C(clk),
    .D(\blk00000003/sig00000028 ),
    .Q(\blk00000003/sig00000022 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000000f  (
    .C(clk),
    .D(\blk00000003/sig00000027 ),
    .Q(\blk00000003/sig00000021 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000000e  (
    .C(clk),
    .D(\blk00000003/sig00000025 ),
    .Q(\blk00000003/sig00000026 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000003/blk0000000d  (
    .C(clk),
    .D(\blk00000003/sig00000023 ),
    .Q(\blk00000003/sig00000024 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000000c  (
    .C(clk),
    .D(\blk00000003/sig00000022 ),
    .Q(\blk00000003/sig0000001e )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000000b  (
    .C(clk),
    .D(\blk00000003/sig00000021 ),
    .Q(\blk00000003/sig0000001c )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk0000000a  (
    .C(clk),
    .D(\blk00000003/sig00000020 ),
    .Q(\blk00000003/sig0000001a )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000009  (
    .C(clk),
    .D(\blk00000003/sig0000001e ),
    .Q(\blk00000003/sig0000001f )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000008  (
    .C(clk),
    .D(\blk00000003/sig0000001c ),
    .Q(\blk00000003/sig0000001d )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000007  (
    .C(clk),
    .D(\blk00000003/sig0000001a ),
    .Q(\blk00000003/sig0000001b )
  );
  FD #(
    .INIT ( 1'b1 ))
  \blk00000003/blk00000006  (
    .C(clk),
    .D(\blk00000003/sig00000018 ),
    .Q(\blk00000003/sig00000019 )
  );
  VCC   \blk00000003/blk00000005  (
    .P(NlwRenamedSig_OI_rfd)
  );
  GND   \blk00000003/blk00000004  (
    .G(\blk00000003/sig00000016 )
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
