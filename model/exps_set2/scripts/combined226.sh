#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined226/combined226.exp"
if [ -f $FPATH ]; then
	python experiment.py combined226 exps_set2/combined226
fi