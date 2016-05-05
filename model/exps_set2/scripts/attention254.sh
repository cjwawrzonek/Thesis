#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention254/attention254.exp"
if [ -f $FPATH ]; then
	python experiment.py attention254 exps_set2/attention254
fi