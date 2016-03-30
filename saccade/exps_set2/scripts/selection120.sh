#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection120/selection120.exp"
if [ -f $FPATH ]; then
	python experiment.py selection120 exps_set2/selection120
fi