#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection86/selection86.exp"
if [ -f $FPATH ]; then
	python experiment.py selection86 exps_set3/selection86
fi