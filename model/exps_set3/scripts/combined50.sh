#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined50/combined50.exp"
if [ -f $FPATH ]; then
	python experiment.py combined50 exps_set3/combined50
fi