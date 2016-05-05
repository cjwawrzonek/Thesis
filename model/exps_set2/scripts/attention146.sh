#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention146/attention146.exp"
if [ -f $FPATH ]; then
	python experiment.py attention146 exps_set2/attention146
fi