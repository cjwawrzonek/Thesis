#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention261/attention261.exp"
if [ -f $FPATH ]; then
	python experiment.py attention261 exps_set2/attention261
fi