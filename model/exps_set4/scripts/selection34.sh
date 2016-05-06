#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection34/selection34.exp"
if [ -f $FPATH ]; then
	python experiment.py selection34 exps_set4/selection34
fi