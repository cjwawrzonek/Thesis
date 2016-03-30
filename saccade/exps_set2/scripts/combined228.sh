#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined228/combined228.exp"
if [ -f $FPATH ]; then
	python experiment.py combined228 exps_set2/combined228
fi