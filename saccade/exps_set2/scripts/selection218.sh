#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection218/selection218.exp"
if [ -f $FPATH ]; then
	python experiment.py selection218 exps_set2/selection218
fi