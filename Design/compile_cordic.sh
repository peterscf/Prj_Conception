#!/bin/bash
#cd ~/Prj_conception/config/config_RTL
#source 

echo "CLEAN"
echo "///////////////////////////////////////////////"
rm -rf compile.log compile_top.log
vdel -lib ~/Prj_conception/Design/libs/lib_VHD -all
vdel -lib ~/Prj_conception/Design/libs/lib_BENCH -all
echo "CLEAN OK"

echo "CREATE LIB"
echo "///////////////////////////////////////////////"
vlib ~/Prj_conception/Design/libs/lib_VHD
vlib ~/Prj_conception/Design/libs/lib_BENCH
echo "CREATE LIB OK"

echo "MAP LIB"
echo "///////////////////////////////////////////////"

vmap lib_BENCH ~/Prj_conception/Design/libs/lib_BENCH
vmap lib_VHD ~/Prj_conception/Design/libs/lib_VHD
echo "COMPILE TOP"
echo "///////////////////////////////////////////////"
vcom -work lib_VHD ~/Prj_conception/Design/top/vhd/CORDIC/*.vhd  > compile_top.log
grep Errors compile_top.log
echo "COMPILE BENCH"
echo "///////////////////////////////////////////////"

vcom -work lib_BENCH ~/Prj_conception/Design/bench/*.vhd > compile.log
grep Errors compile.log
grep Error compile.log

