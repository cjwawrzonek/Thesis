#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention151/attention151.exp"
if [ -f $FPATH ]; then
	python experiment.py attention151 exps_set2/attention151
fi