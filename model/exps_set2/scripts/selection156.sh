#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection156/selection156.exp"
if [ -f $FPATH ]; then
	python experiment.py selection156 exps_set2/selection156
fi