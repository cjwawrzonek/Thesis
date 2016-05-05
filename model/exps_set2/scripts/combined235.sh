#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined235/combined235.exp"
if [ -f $FPATH ]; then
	python experiment.py combined235 exps_set2/combined235
fi