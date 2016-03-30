#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined136/combined136.exp"
if [ -f $FPATH ]; then
	python experiment.py combined136 exps_set2/combined136
fi