#!/bin/bash

source escou_compile.sh

PROJECT_PATH="~/Documents/Prj_conception/Design"
LIB_NAME="lib_BENCH"
VHDL_FILES=`ls -l bench/ | awk {'print$9'} | grep .vhd`
#VHDL_FILES="rom_bench"
OPT_VCOM="-work "

vdel -lib ${PROJECT_PATH}/libs/${LIB_NAME} -all 		# Delete the old version oflibrary
vlib ${PROJECT_PATH}/libs/${LIB_NAME}           		# Create a new library
vmap ${LIB_NAME} ${PROJECT_PATH}/libs/${LIB_NAME} 		# Create a link between the name of the library and its path

for file in ${VHDL_FILES}
do
	vcom ${OPT_VCOM} ${LIB_NAME} bench/${file}		# Compile all the VHDL files contained on the VHDL_FILES variable
								# Use the options on OPT_VCOM variable
done
