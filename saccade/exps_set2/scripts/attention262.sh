#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention262/attention262.exp"
if [ -f $FPATH ]; then
	python experiment.py attention262 exps_set2/attention262
fi