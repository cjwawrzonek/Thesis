#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention188/attention188.exp"
if [ -f $FPATH ]; then
	python experiment.py attention188 exps_set2/attention188
fi