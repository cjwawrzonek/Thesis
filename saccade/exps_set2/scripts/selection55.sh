#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection55/selection55.exp"
if [ -f $FPATH ]; then
	python experiment.py selection55 exps_set2/selection55
fi