#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention246/attention246.exp"
if [ -f $FPATH ]; then
	python experiment.py attention246 exps_set2/attention246
fi