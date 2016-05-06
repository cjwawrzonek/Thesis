#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection84/selection84.exp"
if [ -f $FPATH ]; then
	python experiment.py selection84 exps_set4/selection84
fi