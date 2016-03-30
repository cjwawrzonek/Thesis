#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention276/attention276.exp"
if [ -f $FPATH ]; then
	python experiment.py attention276 exps_set2/attention276
fi