#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection261/selection261.exp"
if [ -f $FPATH ]; then
	python experiment.py selection261 exps_set2/selection261
fi