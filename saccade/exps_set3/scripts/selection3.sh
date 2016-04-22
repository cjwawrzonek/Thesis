#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection3/selection3.exp"
if [ -f $FPATH ]; then
	python experiment.py selection3 exps_set3/selection3
fi