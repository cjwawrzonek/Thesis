#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection8/selection8.exp"
if [ -f $FPATH ]; then
	python experiment.py selection8 exps_set4/selection8
fi