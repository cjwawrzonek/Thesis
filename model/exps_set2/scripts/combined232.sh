#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined232/combined232.exp"
if [ -f $FPATH ]; then
	python experiment.py combined232 exps_set2/combined232
fi