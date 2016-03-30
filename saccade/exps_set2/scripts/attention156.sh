#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention156/attention156.exp"
if [ -f $FPATH ]; then
	python experiment.py attention156 exps_set2/attention156
fi