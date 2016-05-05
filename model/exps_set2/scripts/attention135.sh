#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention135/attention135.exp"
if [ -f $FPATH ]; then
	python experiment.py attention135 exps_set2/attention135
fi