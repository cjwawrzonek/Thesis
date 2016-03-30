#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection273/selection273.exp"
if [ -f $FPATH ]; then
	python experiment.py selection273 exps_set2/selection273
fi