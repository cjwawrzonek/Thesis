#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention165/attention165.exp"
if [ -f $FPATH ]; then
	python experiment.py attention165 exps_set2/attention165
fi