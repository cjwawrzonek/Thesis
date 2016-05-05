#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection50/selection50.exp"
if [ -f $FPATH ]; then
	python experiment.py selection50 exps_set2/selection50
fi