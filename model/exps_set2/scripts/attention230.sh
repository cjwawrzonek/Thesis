#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention230/attention230.exp"
if [ -f $FPATH ]; then
	python experiment.py attention230 exps_set2/attention230
fi