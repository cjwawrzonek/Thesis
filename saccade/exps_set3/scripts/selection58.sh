#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection58/selection58.exp"
if [ -f $FPATH ]; then
	python experiment.py selection58 exps_set3/selection58
fi