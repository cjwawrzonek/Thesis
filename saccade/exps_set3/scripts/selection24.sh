#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection24/selection24.exp"
if [ -f $FPATH ]; then
	python experiment.py selection24 exps_set3/selection24
fi