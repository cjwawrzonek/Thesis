#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection150/selection150.exp"
if [ -f $FPATH ]; then
	python experiment.py selection150 exps_set2/selection150
fi