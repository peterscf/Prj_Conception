/******************************************************************************

Verilog Gate Level Simulation Model
Created by Amethyst (TM) Datapath Compiler

Copyright (c) 2000-2012, Peter A. Ruetz.
All rights reserved.

******************************************************************************/

module DW01_add_atrmacro_8_1 (A,B,CI,CO,SUM);
input [7:0] A, B;
input  CI;
output  CO;
output [7:0] SUM;
wire [8:0] sum;
RTL_XOR I40 (.Z(SUM[0]), .in1(B[0]), .in2(A[0]));
RTL_AND I41 (.Z(N106), .in1(B[0]), .in2(A[0]));
RTL_XNOR I42 (.Z(N155), .in1(B[1]), .in2(A[1]));
RTL_MUX2 I43 (.Z(N111), .in_0(N106), .in_1(A[1]), .sel_0(N155));
RTL_XNOR I44 (.Z(SUM[1]), .in1(N106), .in2(N155));
RTL_XNOR I45 (.Z(N164), .in1(B[2]), .in2(A[2]));
RTL_MUX2 I46 (.Z(N112), .in_0(N111), .in_1(A[2]), .sel_0(N164));
RTL_XNOR I47 (.Z(SUM[2]), .in1(N111), .in2(N164));
RTL_XNOR I48 (.Z(N173), .in1(B[3]), .in2(A[3]));
RTL_MUX2 I49 (.Z(N115), .in_0(N112), .in_1(A[3]), .sel_0(N173));
RTL_XNOR I50 (.Z(SUM[3]), .in1(N112), .in2(N173));
RTL_XNOR I51 (.Z(N182), .in1(B[4]), .in2(A[4]));
RTL_MUX2 I52 (.Z(N116), .in_0(N115), .in_1(A[4]), .sel_0(N182));
RTL_XNOR I53 (.Z(SUM[4]), .in1(N115), .in2(N182));
RTL_XNOR I54 (.Z(N191), .in1(B[5]), .in2(A[5]));
RTL_MUX2 I55 (.Z(N119), .in_0(N116), .in_1(A[5]), .sel_0(N191));
RTL_XNOR I56 (.Z(SUM[5]), .in1(N116), .in2(N191));
RTL_XNOR I57 (.Z(N200), .in1(B[6]), .in2(A[6]));
RTL_MUX2 I58 (.Z(N120), .in_0(N119), .in_1(A[6]), .sel_0(N200));
RTL_XNOR I59 (.Z(SUM[6]), .in1(N119), .in2(N200));
RTL_XNOR I60 (.Z(N209), .in1(B[7]), .in2(A[7]));
RTL_XNOR I62 (.Z(SUM[7]), .in1(N120), .in2(N209));
endmodule
