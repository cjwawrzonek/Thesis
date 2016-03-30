#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined277/combined277.exp"
if [ -f $FPATH ]; then
	python experiment.py combined277 exps_set2/combined277
fi