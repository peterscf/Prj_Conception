#!/bin/sh
echo Synthèse en cours
dc_shell -f ../SCRIPTS/run_synthesis.tcl > ../REPORTS/synth.log
echo Synthèse terminer affichage des Erreurs et Warning

grep  Error ../REPORTS/synth.log

grep  Warning ../REPORTS/synth.log
