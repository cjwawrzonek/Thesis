#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined218/combined218.exp"
if [ -f $FPATH ]; then
	python experiment.py combined218 exps_set2/combined218
fi