#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection48/selection48.exp"
if [ -f $FPATH ]; then
	python experiment.py selection48 exps_set2/selection48
fi