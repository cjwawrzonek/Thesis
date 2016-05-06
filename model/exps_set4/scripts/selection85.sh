#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection85/selection85.exp"
if [ -f $FPATH ]; then
	python experiment.py selection85 exps_set4/selection85
fi