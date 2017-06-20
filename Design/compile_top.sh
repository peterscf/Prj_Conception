#!/bin/bash
#cd ~/Prj_conception/config/config_RTL
#source 

echo "CLEAN"
echo "///////////////////////////////////////////////"
rm -rf compile.log compile_top.log
vdel -lib ~/Prj_conception/Design/libs/lib_VHD_TOP -all
vdel -lib ~/Prj_conception/Design/libs/lib_BENCH_TOP -all
echo "CLEAN OK"

echo "CREATE LIB"
echo "///////////////////////////////////////////////"
vlib ~/Prj_conception/Design/libs/lib_VHD_TOP
vlib ~/Prj_conception/Design/libs/lib_BENCH_TOP
echo "CREATE LIB OK"

echo "MAP LIB"
echo "///////////////////////////////////////////////"

vmap lib_BENCH_TOP ~/Prj_conception/Design/libs/lib_BENCH_TOP 
vmap lib_VHD_TOP ~/Prj_conception/Design/libs/lib_VHD_TOP 
echo "COMPILE TOP"
echo "///////////////////////////////////////////////"
vcom -work lib_VHD_TOP ~/Prj_conception/Design/top/vhd/CORDIC/*.vhd \
	~/Prj_conception/Design/top/vhd/DEMOD/*.vhd \
	~/Prj_conception/Design/top/vhd/MOD/*.vhd \
	~/Prj_conception/Design/top/vhd/*.vhd > compile_top.log
grep Errors compile_top.log
echo "COMPILE BENCH"
echo "///////////////////////////////////////////////"

vcom -work lib_BENCH_TOP ~/Prj_conception/Design/top/bench/*.vhd > compile.log
grep Errors compile.log
grep Error compile.log

