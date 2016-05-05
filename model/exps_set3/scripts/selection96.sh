#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection96/selection96.exp"
if [ -f $FPATH ]; then
	python experiment.py selection96 exps_set3/selection96
fi