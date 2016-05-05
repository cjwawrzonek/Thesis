#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection143/selection143.exp"
if [ -f $FPATH ]; then
	python experiment.py selection143 exps_set2/selection143
fi