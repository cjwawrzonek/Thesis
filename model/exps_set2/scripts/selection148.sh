#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection148/selection148.exp"
if [ -f $FPATH ]; then
	python experiment.py selection148 exps_set2/selection148
fi