#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention83/attention83.exp"
if [ -f $FPATH ]; then
	python experiment.py attention83 exps_set3/attention83
fi