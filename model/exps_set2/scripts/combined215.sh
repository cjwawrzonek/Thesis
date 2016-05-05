#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined215/combined215.exp"
if [ -f $FPATH ]; then
	python experiment.py combined215 exps_set2/combined215
fi