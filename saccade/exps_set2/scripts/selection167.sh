#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection167/selection167.exp"
if [ -f $FPATH ]; then
	python experiment.py selection167 exps_set2/selection167
fi