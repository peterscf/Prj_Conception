#!/bin/sh

echo Synthèse en cours ...
#source ../../config/config_ASIC
dc_shell -f ../SCRIPTS/run_synthesis.tcl > ../REPORTS/synth.log
echo Synthèse terminée : affichage des Errors et Warning

grep  Error ../REPORTS/synth.log
grep  Warning ../REPORTS/synth.log
