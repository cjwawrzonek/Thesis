#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection204/selection204.exp"
if [ -f $FPATH ]; then
	python experiment.py selection204 exps_set2/selection204
fi