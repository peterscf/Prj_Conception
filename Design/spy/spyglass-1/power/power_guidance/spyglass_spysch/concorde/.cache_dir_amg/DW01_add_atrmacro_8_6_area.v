/******************************************************************************

Verilog Gate Level Simulation Model
Created by Amethyst (TM) Datapath Compiler

Copyright (c) 2000-2012, Peter A. Ruetz.
All rights reserved.

******************************************************************************/

module DW01_add_atrmacro_8_6 (A,B,CI,CO,SUM);
input [7:0] A, B;
input  CI;
output  CO;
output [7:0] SUM;
wire [8:0] sum;
RTL_NOT I0 (.Z(SUM[0]), .A(A[0]));
RTL_NOT I38 (.Z(N132), .A(A[1]));
RTL_XNOR I39 (.Z(SUM[1]), .in1(SUM[0]), .in2(A[1]));
RTL_NOR I40 (.Z(N93), .in1(SUM[0]), .in2(N132));
RTL_XNOR I41 (.Z(SUM[2]), .in1(N93), .in2(A[2]));
RTL_NOR I42 (.Z(N96), .in1(N93), .in2(A[2]));
RTL_NOT I43 (.Z(N146), .A(A[3]));
RTL_XOR I44 (.Z(SUM[3]), .in1(N96), .in2(A[3]));
RTL_NAND I45 (.Z(N101), .in1(N96), .in2(N146));
RTL_XOR I46 (.Z(SUM[4]), .in1(N101), .in2(A[4]));
RTL_NAND I47 (.Z(N104), .in1(N101), .in2(A[4]));
RTL_NOT I48 (.Z(N160), .A(A[5]));
RTL_XOR I49 (.Z(SUM[5]), .in1(N104), .in2(A[5]));
RTL_NAND I50 (.Z(N109), .in1(N104), .in2(N160));
RTL_XOR I51 (.Z(SUM[6]), .in1(N109), .in2(A[6]));
RTL_NAND I52 (.Z(N112), .in1(N109), .in2(A[6]));
RTL_XNOR I7 (.Z(SUM[7]), .in1(N112), .in2(A[7]));
endmodule
