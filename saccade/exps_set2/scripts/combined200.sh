#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined200/combined200.exp"
if [ -f $FPATH ]; then
	python experiment.py combined200 exps_set2/combined200
fi