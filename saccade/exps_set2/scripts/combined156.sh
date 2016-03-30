#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined156/combined156.exp"
if [ -f $FPATH ]; then
	python experiment.py combined156 exps_set2/combined156
fi