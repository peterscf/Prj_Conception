/******************************************************************************

Verilog Gate Level Simulation Model
Created by Amethyst (TM) Datapath Compiler

Copyright (c) 2000-2012, Peter A. Ruetz.
All rights reserved.

******************************************************************************/

module DW01_add_atrmacro_8_4 (A,B,CI,CO,SUM);
input [7:0] A, B;
input  CI;
output  CO;
output [7:0] SUM;
wire [8:0] sum;
RTL_NOT I0 (.Z(SUM[1]), .A(A[1]));
RTL_NOT I36 (.Z(N127), .A(A[2]));
RTL_XOR I37 (.Z(SUM[2]), .in1(SUM[1]), .in2(A[2]));
RTL_NAND I38 (.Z(N91), .in1(SUM[1]), .in2(N127));
RTL_XNOR I39 (.Z(SUM[3]), .in1(N91), .in2(A[3]));
RTL_NOR I40 (.Z(N94), .in1(N91), .in2(A[3]));
RTL_NOT I41 (.Z(N141), .A(A[4]));
RTL_XNOR I42 (.Z(SUM[4]), .in1(N94), .in2(A[4]));
RTL_NOR I43 (.Z(N99), .in1(N94), .in2(N141));
RTL_XOR I44 (.Z(SUM[5]), .in1(N99), .in2(A[5]));
RTL_NAND I45 (.Z(N102), .in1(N99), .in2(A[5]));
RTL_NOT I46 (.Z(N155), .A(A[6]));
RTL_XNOR I47 (.Z(SUM[6]), .in1(N102), .in2(A[6]));
RTL_NOR I48 (.Z(N107), .in1(N102), .in2(N155));
RTL_XOR I6 (.Z(SUM[7]), .in1(N107), .in2(A[7]));
RTL_BUF I8 (.Z(SUM[0]), .A(A[0]));
endmodule
