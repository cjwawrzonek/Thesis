#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection5/selection5.exp"
if [ -f $FPATH ]; then
	python experiment.py selection5 exps_set3/selection5
fi