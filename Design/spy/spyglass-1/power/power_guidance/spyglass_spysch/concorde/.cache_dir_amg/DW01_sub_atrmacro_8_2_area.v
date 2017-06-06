/******************************************************************************

Verilog Gate Level Simulation Model
Created by Amethyst (TM) Datapath Compiler

Copyright (c) 2000-2012, Peter A. Ruetz.
All rights reserved.

******************************************************************************/

module DW01_sub_atrmacro_8_2 (A,B,CI,CO,DIFF);
input [7:0] A, B;
input  CI;
output  CO;
output [7:0] DIFF;
wire [8:0] sum;
RTL_NOT I0 (.Z(DIFF[0]), .A(A[0]));
RTL_NOT I38 (.Z(N131), .A(A[1]));
RTL_XNOR I39 (.Z(DIFF[1]), .in1(DIFF[0]), .in2(A[1]));
RTL_NOR I40 (.Z(N93), .in1(DIFF[0]), .in2(N131));
RTL_XNOR I41 (.Z(DIFF[2]), .in1(N93), .in2(A[2]));
RTL_NOR I42 (.Z(N96), .in1(N93), .in2(A[2]));
RTL_NOT I43 (.Z(N145), .A(A[3]));
RTL_XOR I44 (.Z(DIFF[3]), .in1(N96), .in2(A[3]));
RTL_NAND I45 (.Z(N101), .in1(N96), .in2(N145));
RTL_XNOR I46 (.Z(DIFF[4]), .in1(N101), .in2(A[4]));
RTL_NOR I47 (.Z(N104), .in1(N101), .in2(A[4]));
RTL_NOT I48 (.Z(N159), .A(A[5]));
RTL_XOR I49 (.Z(DIFF[5]), .in1(N104), .in2(A[5]));
RTL_NAND I50 (.Z(N109), .in1(N104), .in2(N159));
RTL_XNOR I51 (.Z(DIFF[6]), .in1(N109), .in2(A[6]));
RTL_NOR I52 (.Z(N112), .in1(N109), .in2(A[6]));
RTL_XOR I7 (.Z(DIFF[7]), .in1(N112), .in2(A[7]));
endmodule
