#!/bin/bash

#PRJ_PATH="~/Prj_conception/Design/top"


source ~/Prj_conception/Design/top/../config/config_RTL


#~/Prj_conception/Design/top/MODEL/matlab/simu_2canaux/gene_valid 
cp -r ~/Prj_conception/Design/top/MODEL/matlab/simu_2canaux/bit_sequence.txt ~/Prj_conception/Design/top/MODEL/matlab/simu_2canaux/bit_stream.dat
cp -r ~/Prj_conception/Design/top/MODEL/matlab/simu_2canaux/*.dat ~/Prj_conception/Design/top/bench/
echo "copie des fichier simu validation 2 cannaux ok"
echo "lancement de vsim"

#cd ${PRJ_PATH}/
#./compile_top.sh

#vsim &
