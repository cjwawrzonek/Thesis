#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention210/attention210.exp"
if [ -f $FPATH ]; then
	python experiment.py attention210 exps_set2/attention210
fi