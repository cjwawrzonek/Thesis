#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection237/selection237.exp"
if [ -f $FPATH ]; then
	python experiment.py selection237 exps_set2/selection237
fi