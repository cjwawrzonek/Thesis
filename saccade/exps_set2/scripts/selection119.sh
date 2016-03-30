#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection119/selection119.exp"
if [ -f $FPATH ]; then
	python experiment.py selection119 exps_set2/selection119
fi