#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention85/attention85.exp"
if [ -f $FPATH ]; then
	python experiment.py attention85 exps_set4/attention85
fi