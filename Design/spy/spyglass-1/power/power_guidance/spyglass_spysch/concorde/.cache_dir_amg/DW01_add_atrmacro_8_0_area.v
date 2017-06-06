/******************************************************************************

Verilog Gate Level Simulation Model
Created by Amethyst (TM) Datapath Compiler

Copyright (c) 2000-2012, Peter A. Ruetz.
All rights reserved.

******************************************************************************/

module DW01_add_atrmacro_8_0 (A,B,CI,CO,SUM);
input [7:0] A, B;
input  CI;
output  CO;
output [7:0] SUM;
wire [8:0] sum;
RTL_NOT I0 (.Z(SUM[0]), .A(A[0]));
RTL_NOT I33 (.Z(N127), .A(A[1]));
RTL_XNOR I34 (.Z(SUM[1]), .in1(SUM[0]), .in2(A[1]));
RTL_NOR I35 (.Z(N88), .in1(SUM[0]), .in2(N127));
RTL_XOR I36 (.Z(SUM[2]), .in1(N88), .in2(A[2]));
RTL_NAND I37 (.Z(N91), .in1(N88), .in2(A[2]));
RTL_NOT I38 (.Z(N141), .A(A[3]));
RTL_XNOR I39 (.Z(SUM[3]), .in1(N91), .in2(A[3]));
RTL_NOR I40 (.Z(N96), .in1(N91), .in2(N141));
RTL_XOR I41 (.Z(SUM[4]), .in1(N96), .in2(A[4]));
RTL_NAND I42 (.Z(N99), .in1(N96), .in2(A[4]));
RTL_NOT I43 (.Z(N155), .A(A[5]));
RTL_XNOR I44 (.Z(SUM[5]), .in1(N99), .in2(A[5]));
RTL_NOR I45 (.Z(N104), .in1(N99), .in2(N155));
RTL_XOR I46 (.Z(SUM[6]), .in1(N104), .in2(A[6]));
RTL_NAND I47 (.Z(N107), .in1(N104), .in2(A[6]));
RTL_XNOR I7 (.Z(SUM[7]), .in1(N107), .in2(A[7]));
endmodule
