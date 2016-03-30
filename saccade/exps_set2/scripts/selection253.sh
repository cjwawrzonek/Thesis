#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection253/selection253.exp"
if [ -f $FPATH ]; then
	python experiment.py selection253 exps_set2/selection253
fi