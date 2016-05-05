#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection295/selection295.exp"
if [ -f $FPATH ]; then
	python experiment.py selection295 exps_set2/selection295
fi