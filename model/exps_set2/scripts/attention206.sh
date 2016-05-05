#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention206/attention206.exp"
if [ -f $FPATH ]; then
	python experiment.py attention206 exps_set2/attention206
fi