#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention73/attention73.exp"
if [ -f $FPATH ]; then
	python experiment.py attention73 exps_set2/attention73
fi