#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined205/combined205.exp"
if [ -f $FPATH ]; then
	python experiment.py combined205 exps_set2/combined205
fi