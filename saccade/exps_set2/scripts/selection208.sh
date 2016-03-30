#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection208/selection208.exp"
if [ -f $FPATH ]; then
	python experiment.py selection208 exps_set2/selection208
fi