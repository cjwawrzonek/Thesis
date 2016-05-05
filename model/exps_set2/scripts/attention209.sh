#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention209/attention209.exp"
if [ -f $FPATH ]; then
	python experiment.py attention209 exps_set2/attention209
fi