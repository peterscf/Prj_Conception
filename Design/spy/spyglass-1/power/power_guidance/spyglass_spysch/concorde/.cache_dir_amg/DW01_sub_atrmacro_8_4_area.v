/******************************************************************************

Verilog Gate Level Simulation Model
Created by Amethyst (TM) Datapath Compiler

Copyright (c) 2000-2012, Peter A. Ruetz.
All rights reserved.

******************************************************************************/

module DW01_sub_atrmacro_8_4 (A,B,CI,CO,DIFF);
input [7:0] A, B;
input  CI;
output  CO;
output [7:0] DIFF;
wire [8:0] sum;
RTL_NOT I0 (.Z(DIFF[1]), .A(A[1]));
RTL_NOT I40 (.Z(N132), .A(A[2]));
RTL_XNOR I41 (.Z(DIFF[2]), .in1(DIFF[1]), .in2(A[2]));
RTL_NOR I42 (.Z(N95), .in1(DIFF[1]), .in2(N132));
RTL_XOR I43 (.Z(DIFF[3]), .in1(N95), .in2(A[3]));
RTL_NAND I44 (.Z(N98), .in1(N95), .in2(A[3]));
RTL_NOT I45 (.Z(N146), .A(A[4]));
RTL_XOR I46 (.Z(DIFF[4]), .in1(N98), .in2(A[4]));
RTL_NAND I47 (.Z(N103), .in1(N98), .in2(N146));
RTL_XNOR I48 (.Z(DIFF[5]), .in1(N103), .in2(A[5]));
RTL_NOR I49 (.Z(N106), .in1(N103), .in2(A[5]));
RTL_NOT I50 (.Z(N160), .A(A[6]));
RTL_XOR I51 (.Z(DIFF[6]), .in1(N106), .in2(A[6]));
RTL_NAND I52 (.Z(N111), .in1(N106), .in2(N160));
RTL_XNOR I6 (.Z(DIFF[7]), .in1(N111), .in2(A[7]));
RTL_BUF I7 (.Z(DIFF[0]), .A(A[0]));
endmodule
