#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined112/combined112.exp"
if [ -f $FPATH ]; then
	python experiment.py combined112 exps_set2/combined112
fi