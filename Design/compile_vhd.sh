#!/bin/sh
#source "./config/config_RTL"

set libV ="lib_VHD "
set libB ="lib_BENCH "

set VHD = "./vhd/*.vhd "

		
set BENCH = "./bench/*.vhd "

set OPT="-work "

vcom ${OPT}${libV}${VHD}
vcom ${OPT}${libB}${BENCH}


