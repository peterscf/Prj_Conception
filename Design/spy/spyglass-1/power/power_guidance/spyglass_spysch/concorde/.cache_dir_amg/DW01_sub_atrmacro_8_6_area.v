/******************************************************************************

Verilog Gate Level Simulation Model
Created by Amethyst (TM) Datapath Compiler

Copyright (c) 2000-2012, Peter A. Ruetz.
All rights reserved.

******************************************************************************/

module DW01_sub_atrmacro_8_6 (A,B,CI,CO,DIFF);
input [7:0] A, B;
input  CI;
output  CO;
output [7:0] DIFF;
wire [8:0] sum;
RTL_NOT I0 (.Z(DIFF[0]), .A(A[0]));
RTL_NOT I42 (.Z(N135), .A(A[1]));
RTL_XOR I43 (.Z(DIFF[1]), .in1(DIFF[0]), .in2(A[1]));
RTL_NAND I44 (.Z(N97), .in1(DIFF[0]), .in2(N135));
RTL_XOR I45 (.Z(DIFF[2]), .in1(N97), .in2(A[2]));
RTL_NAND I46 (.Z(N100), .in1(N97), .in2(A[2]));
RTL_NOT I47 (.Z(N149), .A(A[3]));
RTL_XNOR I48 (.Z(DIFF[3]), .in1(N100), .in2(A[3]));
RTL_NOR I49 (.Z(N105), .in1(N100), .in2(N149));
RTL_XNOR I50 (.Z(DIFF[4]), .in1(N105), .in2(A[4]));
RTL_NOR I51 (.Z(N108), .in1(N105), .in2(A[4]));
RTL_NOT I52 (.Z(N163), .A(A[5]));
RTL_XNOR I53 (.Z(DIFF[5]), .in1(N108), .in2(A[5]));
RTL_NOR I54 (.Z(N113), .in1(N108), .in2(N163));
RTL_XNOR I55 (.Z(DIFF[6]), .in1(N113), .in2(A[6]));
RTL_NOR I56 (.Z(N116), .in1(N113), .in2(A[6]));
RTL_XOR I7 (.Z(DIFF[7]), .in1(N116), .in2(A[7]));
endmodule
