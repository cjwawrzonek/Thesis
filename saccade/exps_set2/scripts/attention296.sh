#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention296/attention296.exp"
if [ -f $FPATH ]; then
	python experiment.py attention296 exps_set2/attention296
fi