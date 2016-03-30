#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention253/attention253.exp"
if [ -f $FPATH ]; then
	python experiment.py attention253 exps_set2/attention253
fi