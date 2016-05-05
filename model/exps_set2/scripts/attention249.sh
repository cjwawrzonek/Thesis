#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention249/attention249.exp"
if [ -f $FPATH ]; then
	python experiment.py attention249 exps_set2/attention249
fi