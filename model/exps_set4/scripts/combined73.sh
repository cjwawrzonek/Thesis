#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined73/combined73.exp"
if [ -f $FPATH ]; then
	python experiment.py combined73 exps_set4/combined73
fi