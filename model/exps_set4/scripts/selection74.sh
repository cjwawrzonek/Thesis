#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection74/selection74.exp"
if [ -f $FPATH ]; then
	python experiment.py selection74 exps_set4/selection74
fi