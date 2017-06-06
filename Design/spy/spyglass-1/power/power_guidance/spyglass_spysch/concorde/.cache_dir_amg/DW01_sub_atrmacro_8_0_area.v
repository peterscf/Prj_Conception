/******************************************************************************

Verilog Gate Level Simulation Model
Created by Amethyst (TM) Datapath Compiler

Copyright (c) 2000-2012, Peter A. Ruetz.
All rights reserved.

******************************************************************************/

module DW01_sub_atrmacro_8_0 (A,B,CI,CO,DIFF);
input [7:0] A, B;
input  CI;
output  CO;
output [7:0] DIFF;
wire [8:0] sum;
RTL_NOT I0 (.Z(DIFF[0]), .A(A[0]));
RTL_NOT I37 (.Z(N130), .A(A[1]));
RTL_XOR I38 (.Z(DIFF[1]), .in1(DIFF[0]), .in2(A[1]));
RTL_NAND I39 (.Z(N92), .in1(DIFF[0]), .in2(N130));
RTL_XNOR I40 (.Z(DIFF[2]), .in1(N92), .in2(A[2]));
RTL_NOR I41 (.Z(N95), .in1(N92), .in2(A[2]));
RTL_NOT I42 (.Z(N144), .A(A[3]));
RTL_XOR I43 (.Z(DIFF[3]), .in1(N95), .in2(A[3]));
RTL_NAND I44 (.Z(N100), .in1(N95), .in2(N144));
RTL_XNOR I45 (.Z(DIFF[4]), .in1(N100), .in2(A[4]));
RTL_NOR I46 (.Z(N103), .in1(N100), .in2(A[4]));
RTL_NOT I47 (.Z(N158), .A(A[5]));
RTL_XOR I48 (.Z(DIFF[5]), .in1(N103), .in2(A[5]));
RTL_NAND I49 (.Z(N108), .in1(N103), .in2(N158));
RTL_XNOR I50 (.Z(DIFF[6]), .in1(N108), .in2(A[6]));
RTL_NOR I51 (.Z(N111), .in1(N108), .in2(A[6]));
RTL_XOR I7 (.Z(DIFF[7]), .in1(N111), .in2(A[7]));
endmodule
