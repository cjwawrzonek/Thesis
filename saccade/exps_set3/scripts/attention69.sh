#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention69/attention69.exp"
if [ -f $FPATH ]; then
	python experiment.py attention69 exps_set3/attention69
fi