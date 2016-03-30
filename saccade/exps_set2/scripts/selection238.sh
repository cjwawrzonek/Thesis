#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection238/selection238.exp"
if [ -f $FPATH ]; then
	python experiment.py selection238 exps_set2/selection238
fi