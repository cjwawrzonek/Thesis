#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined223/combined223.exp"
if [ -f $FPATH ]; then
	python experiment.py combined223 exps_set2/combined223
fi