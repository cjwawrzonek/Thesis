#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection211/selection211.exp"
if [ -f $FPATH ]; then
	python experiment.py selection211 exps_set2/selection211
fi