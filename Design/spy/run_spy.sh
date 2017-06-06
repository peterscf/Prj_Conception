#!/bin/sh

source ../../config/config_VERIF

echo running spyglass verifications ...

sg_shell ../SCRIPTS/run_spyglass.tcl > ../REPORTS/Spy.log


grep  Error ../REPORTS/Spy.log
grep  Warning ../REPORTS/Spy.log
