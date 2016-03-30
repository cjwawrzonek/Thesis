#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection232/selection232.exp"
if [ -f $FPATH ]; then
	python experiment.py selection232 exps_set2/selection232
fi