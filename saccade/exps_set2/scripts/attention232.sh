#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention232/attention232.exp"
if [ -f $FPATH ]; then
	python experiment.py attention232 exps_set2/attention232
fi