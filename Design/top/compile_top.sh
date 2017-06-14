#!/bin/bash
#cd ~/Prj_conception/config/config_RTL
#source 

#set PROJECT_PATH="~/Prj_conception/Design/"
#set LIB_NAME_BENCH="lib_BENCH_TOP"
#set LIB_NAME_VHD="lib_VHD_TOP"
#VHDL_FILES=`ls -l vhd/ | awk {'print$9'} | grep .vhd`
#VHDL_FILES="rom_bench"
#set OPT_VCOM="-work "

#vdel -lib ${PROJECT_PATH}/libs/${LIB_NAME} --all 		# Delete the old version oflibrary
#vlib ${PROJECT_PATH}/libs/${LIB_NAME}           		# Create a new library
#vmap ${LIB_NAME} ${PROJECT_PATH}/top/libs/${LIB_NAME} 		# Create a link between the name of the library and its path
#vdel -lib ~/Prj_conception/Design/libs/lib_VHD_TOP
#vdel -lib ~/Prj_conception/Design/libs/lib_BENCH_TOP


#vlib ~/Prj_conception/Design/libs/lib_VHD_TOP
#vlib ~/Prj_conception/Design/libs/lib_BENCH_TOP

vmap lib_BENCH_TOP ~/Prj_conception/Design/libs/lib_BENCH_TOP
vmap lib_VHD_TOP ~/Prj_conception/Design/libs/lib_VHD_TOP





vcom -work lib_VHD_TOP ~/Prj_conception/Design/top/vhd/CORDIC/*.vhd
vcom -work lib_VHD_TOP ~/Prj_conception/Design/top/vhd/DEMOD/*.vhd
vcom -work lib_VHD_TOP ~/Prj_conception/Design/top/vhd/MOD/*.vhd
vcom -work lib_VHD_TOP ~/Prj_conception/Design/top/vhd/*.vhd

vcom -work lib_BENCH_TOP ~/Prj_conception/Design/top/bench/*.vhd




#for file in ${VHDL_FILES}
#do
#	vcom ${OPT_VCOM} ${LIB_NAME} bench/${file}		# Compile all the VHDL files contained on the VHDL_FILES variable
#								# Use the options on OPT_VCOM variable
#done
