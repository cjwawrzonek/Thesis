#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention99/attention99.exp"
if [ -f $FPATH ]; then
	python experiment.py attention99 exps_set2/attention99
fi