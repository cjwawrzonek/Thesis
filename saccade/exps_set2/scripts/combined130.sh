#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined130/combined130.exp"
if [ -f $FPATH ]; then
	python experiment.py combined130 exps_set2/combined130
fi