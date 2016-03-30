#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention241/attention241.exp"
if [ -f $FPATH ]; then
	python experiment.py attention241 exps_set2/attention241
fi