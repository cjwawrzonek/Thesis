#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined174/combined174.exp"
if [ -f $FPATH ]; then
	python experiment.py combined174 exps_set2/combined174
fi