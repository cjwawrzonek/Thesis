#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention161/attention161.exp"
if [ -f $FPATH ]; then
	python experiment.py attention161 exps_set2/attention161
fi