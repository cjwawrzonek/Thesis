#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined120/combined120.exp"
if [ -f $FPATH ]; then
	python experiment.py combined120 exps_set2/combined120
fi