#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined261/combined261.exp"
if [ -f $FPATH ]; then
	python experiment.py combined261 exps_set2/combined261
fi