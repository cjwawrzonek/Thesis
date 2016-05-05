#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection286/selection286.exp"
if [ -f $FPATH ]; then
	python experiment.py selection286 exps_set2/selection286
fi