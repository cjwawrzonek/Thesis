#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention171/attention171.exp"
if [ -f $FPATH ]; then
	python experiment.py attention171 exps_set2/attention171
fi