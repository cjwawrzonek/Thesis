#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention275/attention275.exp"
if [ -f $FPATH ]; then
	python experiment.py attention275 exps_set2/attention275
fi