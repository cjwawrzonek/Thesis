#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection149/selection149.exp"
if [ -f $FPATH ]; then
	python experiment.py selection149 exps_set2/selection149
fi