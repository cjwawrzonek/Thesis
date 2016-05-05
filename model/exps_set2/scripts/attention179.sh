#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention179/attention179.exp"
if [ -f $FPATH ]; then
	python experiment.py attention179 exps_set2/attention179
fi