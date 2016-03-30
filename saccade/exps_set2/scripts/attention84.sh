#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention84/attention84.exp"
if [ -f $FPATH ]; then
	python experiment.py attention84 exps_set2/attention84
fi