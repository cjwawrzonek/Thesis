#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection17/selection17.exp"
if [ -f $FPATH ]; then
	python experiment.py selection17 exps_set3/selection17
fi