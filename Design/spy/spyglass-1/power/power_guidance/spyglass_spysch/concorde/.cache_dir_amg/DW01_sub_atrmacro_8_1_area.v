/******************************************************************************

Verilog Gate Level Simulation Model
Created by Amethyst (TM) Datapath Compiler

Copyright (c) 2000-2012, Peter A. Ruetz.
All rights reserved.

******************************************************************************/

module DW01_sub_atrmacro_8_1 (A,B,CI,CO,DIFF);
input [7:0] A, B;
input  CI;
output  CO;
output [7:0] DIFF;
wire [8:0] sum;
RTL_NOT I0 (.Z(N75), .A(B[0]));
RTL_XNOR I43 (.Z(DIFF[0]), .in1(A[0]), .in2(N75));
RTL_NOR I44 (.Z(N101), .in1(A[0]), .in2(N75));
RTL_XNOR I46 (.Z(N149), .in1(A[1]), .in2(B[1]));
RTL_MUX2 I70 (.Z(N106), .in_0(B[1]), .in_1(N101), .sel_0(N149));
RTL_XNOR I51 (.Z(DIFF[1]), .in1(N101), .in2(N149));
RTL_XNOR I52 (.Z(N162), .in1(A[2]), .in2(B[2]));
RTL_MUX2 I53 (.Z(N107), .in_0(B[2]), .in_1(N106), .sel_0(N162));
RTL_XNOR I54 (.Z(DIFF[2]), .in1(N106), .in2(N162));
RTL_XNOR I55 (.Z(N171), .in1(A[3]), .in2(B[3]));
RTL_MUX2 I56 (.Z(N110), .in_0(B[3]), .in_1(N107), .sel_0(N171));
RTL_XNOR I57 (.Z(DIFF[3]), .in1(N107), .in2(N171));
RTL_XNOR I58 (.Z(N180), .in1(A[4]), .in2(B[4]));
RTL_MUX2 I59 (.Z(N111), .in_0(B[4]), .in_1(N110), .sel_0(N180));
RTL_XNOR I60 (.Z(DIFF[4]), .in1(N110), .in2(N180));
RTL_XNOR I61 (.Z(N189), .in1(A[5]), .in2(B[5]));
RTL_MUX2 I62 (.Z(N114), .in_0(B[5]), .in_1(N111), .sel_0(N189));
RTL_XNOR I63 (.Z(DIFF[5]), .in1(N111), .in2(N189));
RTL_XNOR I64 (.Z(N198), .in1(A[6]), .in2(B[6]));
RTL_MUX2 I65 (.Z(N115), .in_0(B[6]), .in_1(N114), .sel_0(N198));
RTL_XNOR I66 (.Z(DIFF[6]), .in1(N114), .in2(N198));
RTL_XNOR I67 (.Z(N207), .in1(A[7]), .in2(B[7]));
RTL_XNOR I69 (.Z(DIFF[7]), .in1(N115), .in2(N207));
endmodule
