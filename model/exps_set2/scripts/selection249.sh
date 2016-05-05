#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection249/selection249.exp"
if [ -f $FPATH ]; then
	python experiment.py selection249 exps_set2/selection249
fi