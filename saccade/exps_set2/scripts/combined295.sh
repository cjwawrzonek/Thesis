#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined295/combined295.exp"
if [ -f $FPATH ]; then
	python experiment.py combined295 exps_set2/combined295
fi