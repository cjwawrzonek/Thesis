#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection227/selection227.exp"
if [ -f $FPATH ]; then
	python experiment.py selection227 exps_set2/selection227
fi