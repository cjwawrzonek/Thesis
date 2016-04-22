#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection77/selection77.exp"
if [ -f $FPATH ]; then
	python experiment.py selection77 exps_set3/selection77
fi