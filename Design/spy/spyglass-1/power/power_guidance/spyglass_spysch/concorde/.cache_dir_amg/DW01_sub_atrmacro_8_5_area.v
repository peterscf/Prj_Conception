/******************************************************************************

Verilog Gate Level Simulation Model
Created by Amethyst (TM) Datapath Compiler

Copyright (c) 2000-2012, Peter A. Ruetz.
All rights reserved.

******************************************************************************/

module DW01_sub_atrmacro_8_5 (A,B,CI,CO,DIFF);
input [7:0] A, B;
input  CI;
output  CO;
output [7:0] DIFF;
wire [8:0] sum;
RTL_NOT I0 (.Z(DIFF[1]), .A(A[1]));
RTL_NOT I41 (.Z(N133), .A(A[2]));
RTL_XOR I42 (.Z(DIFF[2]), .in1(DIFF[1]), .in2(A[2]));
RTL_NAND I43 (.Z(N96), .in1(DIFF[1]), .in2(N133));
RTL_XOR I44 (.Z(DIFF[3]), .in1(N96), .in2(A[3]));
RTL_NAND I45 (.Z(N99), .in1(N96), .in2(A[3]));
RTL_NOT I46 (.Z(N147), .A(A[4]));
RTL_XNOR I47 (.Z(DIFF[4]), .in1(N99), .in2(A[4]));
RTL_NOR I48 (.Z(N104), .in1(N99), .in2(N147));
RTL_XNOR I49 (.Z(DIFF[5]), .in1(N104), .in2(A[5]));
RTL_NOR I50 (.Z(N107), .in1(N104), .in2(A[5]));
RTL_NOT I51 (.Z(N161), .A(A[6]));
RTL_XOR I52 (.Z(DIFF[6]), .in1(N107), .in2(A[6]));
RTL_NAND I53 (.Z(N112), .in1(N107), .in2(N161));
RTL_XNOR I6 (.Z(DIFF[7]), .in1(N112), .in2(A[7]));
RTL_BUF I7 (.Z(DIFF[0]), .A(A[0]));
endmodule
