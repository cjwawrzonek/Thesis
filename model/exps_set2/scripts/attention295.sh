#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention295/attention295.exp"
if [ -f $FPATH ]; then
	python experiment.py attention295 exps_set2/attention295
fi