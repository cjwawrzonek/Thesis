#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention57/attention57.exp"
if [ -f $FPATH ]; then
	python experiment.py attention57 exps_set3/attention57
fi