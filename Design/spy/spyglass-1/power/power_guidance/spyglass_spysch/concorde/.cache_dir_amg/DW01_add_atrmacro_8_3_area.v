/******************************************************************************

Verilog Gate Level Simulation Model
Created by Amethyst (TM) Datapath Compiler

Copyright (c) 2000-2012, Peter A. Ruetz.
All rights reserved.

******************************************************************************/

module DW01_add_atrmacro_8_3 (A,B,CI,CO,SUM);
input [7:0] A, B;
input  CI;
output  CO;
output [7:0] SUM;
wire [8:0] sum;
RTL_NOT I0 (.Z(SUM[0]), .A(A[0]));
RTL_NOT I35 (.Z(N129), .A(A[1]));
RTL_XOR I36 (.Z(SUM[1]), .in1(SUM[0]), .in2(A[1]));
RTL_NAND I37 (.Z(N90), .in1(SUM[0]), .in2(N129));
RTL_XNOR I38 (.Z(SUM[2]), .in1(N90), .in2(A[2]));
RTL_NOR I39 (.Z(N93), .in1(N90), .in2(A[2]));
RTL_NOT I40 (.Z(N143), .A(A[3]));
RTL_XNOR I41 (.Z(SUM[3]), .in1(N93), .in2(A[3]));
RTL_NOR I42 (.Z(N98), .in1(N93), .in2(N143));
RTL_XOR I43 (.Z(SUM[4]), .in1(N98), .in2(A[4]));
RTL_NAND I44 (.Z(N101), .in1(N98), .in2(A[4]));
RTL_NOT I45 (.Z(N157), .A(A[5]));
RTL_XNOR I46 (.Z(SUM[5]), .in1(N101), .in2(A[5]));
RTL_NOR I47 (.Z(N106), .in1(N101), .in2(N157));
RTL_XOR I48 (.Z(SUM[6]), .in1(N106), .in2(A[6]));
RTL_NAND I49 (.Z(N109), .in1(N106), .in2(A[6]));
RTL_XNOR I7 (.Z(SUM[7]), .in1(N109), .in2(A[7]));
endmodule
