#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention101/attention101.exp"
if [ -f $FPATH ]; then
	python experiment.py attention101 exps_set2/attention101
fi