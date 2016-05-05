#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention174/attention174.exp"
if [ -f $FPATH ]; then
	python experiment.py attention174 exps_set2/attention174
fi