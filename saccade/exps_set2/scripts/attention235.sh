#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention235/attention235.exp"
if [ -f $FPATH ]; then
	python experiment.py attention235 exps_set2/attention235
fi