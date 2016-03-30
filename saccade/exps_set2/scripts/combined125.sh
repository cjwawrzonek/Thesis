#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined125/combined125.exp"
if [ -f $FPATH ]; then
	python experiment.py combined125 exps_set2/combined125
fi