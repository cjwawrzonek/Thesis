#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection50/selection50.exp"
if [ -f $FPATH ]; then
	python experiment.py selection50 exps_set4/selection50
fi