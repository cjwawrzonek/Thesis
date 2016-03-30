#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention263/attention263.exp"
if [ -f $FPATH ]; then
	python experiment.py attention263 exps_set2/attention263
fi