#source "./config/config_RTL"

set libV = lib_VHD
set libB = lib_BENCH

set VHD = "./vhd/cell.vhd\
		./vhd/cordic.vhd\
		./vhd/pre_process.vhd"

		
set BENCH = "./bench/*.vhd"

vcom -work $libV $VHD
vcom -work $libB $BENCH


