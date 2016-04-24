#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention73/attention73.exp"
if [ -f $FPATH ]; then
	python experiment.py attention73 exps_set3/attention73
fi