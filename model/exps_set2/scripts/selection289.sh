#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection289/selection289.exp"
if [ -f $FPATH ]; then
	python experiment.py selection289 exps_set2/selection289
fi