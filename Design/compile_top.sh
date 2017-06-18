#!/bin/bash
#cd ~/Prj_conception/config/config_RTL
#source 

vdel -lib ~/Prj_conception/Design/libs/lib_VHD_TOP -all
vdel -lib ~/Prj_conception/Design/libs/lib_BENCH_TOP -all


vlib ~/Prj_conception/Design/libs/lib_VHD_TOP
vlib ~/Prj_conception/Design/libs/lib_BENCH_TOP

vmap lib_BENCH_TOP ~/Prj_conception/Design/libs/lib_BENCH_TOP 
vmap lib_VHD_TOP ~/Prj_conception/Design/libs/lib_VHD_TOP 

vcom -work lib_VHD_TOP ~/Prj_conception/Design/top/vhd/CORDIC/*.vhd \
	~/Prj_conception/Design/top/vhd/DEMOD/*.vhd \
	~/Prj_conception/Design/top/vhd/MOD/*.vhd \
	~/Prj_conception/Design/top/vhd/*.vhd

vcom -work lib_BENCH_TOP ~/Prj_conception/Design/top/bench/*.vhd

