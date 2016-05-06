#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention100/attention100.exp"
if [ -f $FPATH ]; then
	python experiment.py attention100 exps_set4/attention100
fi