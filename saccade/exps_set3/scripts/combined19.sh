#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined19/combined19.exp"
if [ -f $FPATH ]; then
	python experiment.py combined19 exps_set3/combined19
fi