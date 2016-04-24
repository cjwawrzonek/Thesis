#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined39/combined39.exp"
if [ -f $FPATH ]; then
	python experiment.py combined39 exps_set3/combined39
fi