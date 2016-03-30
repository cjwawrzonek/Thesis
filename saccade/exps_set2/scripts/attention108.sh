#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention108/attention108.exp"
if [ -f $FPATH ]; then
	python experiment.py attention108 exps_set2/attention108
fi