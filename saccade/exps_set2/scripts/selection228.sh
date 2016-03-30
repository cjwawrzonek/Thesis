#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection228/selection228.exp"
if [ -f $FPATH ]; then
	python experiment.py selection228 exps_set2/selection228
fi