#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention38/attention38.exp"
if [ -f $FPATH ]; then
	python experiment.py attention38 exps_set2/attention38
fi