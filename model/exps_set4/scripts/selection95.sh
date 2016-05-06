#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection95/selection95.exp"
if [ -f $FPATH ]; then
	python experiment.py selection95 exps_set4/selection95
fi