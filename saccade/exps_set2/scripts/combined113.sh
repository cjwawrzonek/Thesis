#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined113/combined113.exp"
if [ -f $FPATH ]; then
	python experiment.py combined113 exps_set2/combined113
fi