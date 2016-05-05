#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined254/combined254.exp"
if [ -f $FPATH ]; then
	python experiment.py combined254 exps_set2/combined254
fi