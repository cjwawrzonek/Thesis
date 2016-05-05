#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention127/attention127.exp"
if [ -f $FPATH ]; then
	python experiment.py attention127 exps_set2/attention127
fi