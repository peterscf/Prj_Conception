/******************************************************************************

Verilog Gate Level Simulation Model
Created by Amethyst (TM) Datapath Compiler

Copyright (c) 2000-2012, Peter A. Ruetz.
All rights reserved.

******************************************************************************/

module DW01_add_atrmacro_8_2 (A,B,CI,CO,SUM);
input [7:0] A, B;
input  CI;
output  CO;
output [7:0] SUM;
wire [8:0] sum;
RTL_NOT I0 (.Z(SUM[0]), .A(A[0]));
RTL_NOT I34 (.Z(N128), .A(A[1]));
RTL_XOR I35 (.Z(SUM[1]), .in1(SUM[0]), .in2(A[1]));
RTL_NAND I36 (.Z(N89), .in1(SUM[0]), .in2(N128));
RTL_XOR I37 (.Z(SUM[2]), .in1(N89), .in2(A[2]));
RTL_NAND I38 (.Z(N92), .in1(N89), .in2(A[2]));
RTL_NOT I39 (.Z(N142), .A(A[3]));
RTL_XNOR I40 (.Z(SUM[3]), .in1(N92), .in2(A[3]));
RTL_NOR I41 (.Z(N97), .in1(N92), .in2(N142));
RTL_XOR I42 (.Z(SUM[4]), .in1(N97), .in2(A[4]));
RTL_NAND I43 (.Z(N100), .in1(N97), .in2(A[4]));
RTL_NOT I44 (.Z(N156), .A(A[5]));
RTL_XNOR I45 (.Z(SUM[5]), .in1(N100), .in2(A[5]));
RTL_NOR I46 (.Z(N105), .in1(N100), .in2(N156));
RTL_XOR I47 (.Z(SUM[6]), .in1(N105), .in2(A[6]));
RTL_NAND I48 (.Z(N108), .in1(N105), .in2(A[6]));
RTL_XNOR I7 (.Z(SUM[7]), .in1(N108), .in2(A[7]));
endmodule
