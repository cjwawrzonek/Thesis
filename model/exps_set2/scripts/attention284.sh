#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention284/attention284.exp"
if [ -f $FPATH ]; then
	python experiment.py attention284 exps_set2/attention284
fi