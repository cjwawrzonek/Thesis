#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention99/attention99.exp"
if [ -f $FPATH ]; then
	python experiment.py attention99 exps_set3/attention99
fi