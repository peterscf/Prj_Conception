/******************************************************************************

Verilog Gate Level Simulation Model
Created by Amethyst (TM) Datapath Compiler

Copyright (c) 2000-2012, Peter A. Ruetz.
All rights reserved.

******************************************************************************/

module DW01_add_atrmacro_8_5 (A,B,CI,CO,SUM);
input [7:0] A, B;
input  CI;
output  CO;
output [7:0] SUM;
wire [8:0] sum;
RTL_NOT I0 (.Z(SUM[1]), .A(A[1]));
RTL_NOT I37 (.Z(N128), .A(A[2]));
RTL_XNOR I38 (.Z(SUM[2]), .in1(SUM[1]), .in2(A[2]));
RTL_NOR I39 (.Z(N92), .in1(SUM[1]), .in2(N128));
RTL_XNOR I40 (.Z(SUM[3]), .in1(N92), .in2(A[3]));
RTL_NOR I41 (.Z(N95), .in1(N92), .in2(A[3]));
RTL_NOT I42 (.Z(N142), .A(A[4]));
RTL_XOR I43 (.Z(SUM[4]), .in1(N95), .in2(A[4]));
RTL_NAND I44 (.Z(N100), .in1(N95), .in2(N142));
RTL_XOR I45 (.Z(SUM[5]), .in1(N100), .in2(A[5]));
RTL_NAND I46 (.Z(N103), .in1(N100), .in2(A[5]));
RTL_NOT I47 (.Z(N156), .A(A[6]));
RTL_XNOR I48 (.Z(SUM[6]), .in1(N103), .in2(A[6]));
RTL_NOR I49 (.Z(N108), .in1(N103), .in2(N156));
RTL_XOR I6 (.Z(SUM[7]), .in1(N108), .in2(A[7]));
RTL_BUF I8 (.Z(SUM[0]), .A(A[0]));
endmodule
