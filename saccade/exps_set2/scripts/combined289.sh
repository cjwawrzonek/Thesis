#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined289/combined289.exp"
if [ -f $FPATH ]; then
	python experiment.py combined289 exps_set2/combined289
fi