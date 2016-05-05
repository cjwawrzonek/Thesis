#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined77/combined77.exp"
if [ -f $FPATH ]; then
	python experiment.py combined77 exps_set2/combined77
fi