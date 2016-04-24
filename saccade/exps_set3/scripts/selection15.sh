#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection15/selection15.exp"
if [ -f $FPATH ]; then
	python experiment.py selection15 exps_set3/selection15
fi