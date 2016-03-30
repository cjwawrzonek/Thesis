#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention218/attention218.exp"
if [ -f $FPATH ]; then
	python experiment.py attention218 exps_set2/attention218
fi