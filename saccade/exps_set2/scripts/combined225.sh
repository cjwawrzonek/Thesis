#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined225/combined225.exp"
if [ -f $FPATH ]; then
	python experiment.py combined225 exps_set2/combined225
fi