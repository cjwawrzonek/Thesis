#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection225/selection225.exp"
if [ -f $FPATH ]; then
	python experiment.py selection225 exps_set2/selection225
fi