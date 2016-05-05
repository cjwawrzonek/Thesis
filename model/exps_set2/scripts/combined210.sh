#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined210/combined210.exp"
if [ -f $FPATH ]; then
	python experiment.py combined210 exps_set2/combined210
fi