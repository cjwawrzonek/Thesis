#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention30/attention30.exp"
if [ -f $FPATH ]; then
	python experiment.py attention30 exps_set3/attention30
fi