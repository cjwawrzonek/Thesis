#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection135/selection135.exp"
if [ -f $FPATH ]; then
	python experiment.py selection135 exps_set2/selection135
fi