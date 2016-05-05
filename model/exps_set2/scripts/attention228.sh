#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention228/attention228.exp"
if [ -f $FPATH ]; then
	python experiment.py attention228 exps_set2/attention228
fi