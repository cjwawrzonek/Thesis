#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention153/attention153.exp"
if [ -f $FPATH ]; then
	python experiment.py attention153 exps_set2/attention153
fi