#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention85/attention85.exp"
if [ -f $FPATH ]; then
	python experiment.py attention85 exps_set2/attention85
fi