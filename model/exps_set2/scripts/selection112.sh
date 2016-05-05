#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection112/selection112.exp"
if [ -f $FPATH ]; then
	python experiment.py selection112 exps_set2/selection112
fi