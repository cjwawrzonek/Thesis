#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection274/selection274.exp"
if [ -f $FPATH ]; then
	python experiment.py selection274 exps_set2/selection274
fi