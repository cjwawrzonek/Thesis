#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined119/combined119.exp"
if [ -f $FPATH ]; then
	python experiment.py combined119 exps_set2/combined119
fi