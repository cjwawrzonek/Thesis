#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection58/selection58.exp"
if [ -f $FPATH ]; then
	python experiment.py selection58 exps_set2/selection58
fi