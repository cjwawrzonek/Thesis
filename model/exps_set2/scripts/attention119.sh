#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention119/attention119.exp"
if [ -f $FPATH ]; then
	python experiment.py attention119 exps_set2/attention119
fi