#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection30/selection30.exp"
if [ -f $FPATH ]; then
	python experiment.py selection30 exps_set3/selection30
fi