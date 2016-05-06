#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection64/selection64.exp"
if [ -f $FPATH ]; then
	python experiment.py selection64 exps_set4/selection64
fi