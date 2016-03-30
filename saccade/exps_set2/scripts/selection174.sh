#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection174/selection174.exp"
if [ -f $FPATH ]; then
	python experiment.py selection174 exps_set2/selection174
fi