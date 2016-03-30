#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection205/selection205.exp"
if [ -f $FPATH ]; then
	python experiment.py selection205 exps_set2/selection205
fi