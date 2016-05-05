#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention202/attention202.exp"
if [ -f $FPATH ]; then
	python experiment.py attention202 exps_set2/attention202
fi