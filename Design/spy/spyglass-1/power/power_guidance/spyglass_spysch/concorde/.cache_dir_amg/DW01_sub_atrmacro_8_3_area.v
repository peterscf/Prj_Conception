/******************************************************************************

Verilog Gate Level Simulation Model
Created by Amethyst (TM) Datapath Compiler

Copyright (c) 2000-2012, Peter A. Ruetz.
All rights reserved.

******************************************************************************/

module DW01_sub_atrmacro_8_3 (A,B,CI,CO,DIFF);
input [7:0] A, B;
input  CI;
output  CO;
output [7:0] DIFF;
wire [8:0] sum;
RTL_NOT I0 (.Z(DIFF[0]), .A(A[0]));
RTL_NOT I39 (.Z(N132), .A(A[1]));
RTL_XNOR I40 (.Z(DIFF[1]), .in1(DIFF[0]), .in2(A[1]));
RTL_NOR I41 (.Z(N94), .in1(DIFF[0]), .in2(N132));
RTL_XOR I42 (.Z(DIFF[2]), .in1(N94), .in2(A[2]));
RTL_NAND I43 (.Z(N97), .in1(N94), .in2(A[2]));
RTL_NOT I44 (.Z(N146), .A(A[3]));
RTL_XOR I45 (.Z(DIFF[3]), .in1(N97), .in2(A[3]));
RTL_NAND I46 (.Z(N102), .in1(N97), .in2(N146));
RTL_XNOR I47 (.Z(DIFF[4]), .in1(N102), .in2(A[4]));
RTL_NOR I48 (.Z(N105), .in1(N102), .in2(A[4]));
RTL_NOT I49 (.Z(N160), .A(A[5]));
RTL_XOR I50 (.Z(DIFF[5]), .in1(N105), .in2(A[5]));
RTL_NAND I51 (.Z(N110), .in1(N105), .in2(N160));
RTL_XNOR I52 (.Z(DIFF[6]), .in1(N110), .in2(A[6]));
RTL_NOR I53 (.Z(N113), .in1(N110), .in2(A[6]));
RTL_XOR I7 (.Z(DIFF[7]), .in1(N113), .in2(A[7]));
endmodule
