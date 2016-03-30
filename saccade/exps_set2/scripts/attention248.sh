#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention248/attention248.exp"
if [ -f $FPATH ]; then
	python experiment.py attention248 exps_set2/attention248
fi