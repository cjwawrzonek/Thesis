#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention113/attention113.exp"
if [ -f $FPATH ]; then
	python experiment.py attention113 exps_set2/attention113
fi