#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention95/attention95.exp"
if [ -f $FPATH ]; then
	python experiment.py attention95 exps_set3/attention95
fi