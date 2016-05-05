#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention140/attention140.exp"
if [ -f $FPATH ]; then
	python experiment.py attention140 exps_set2/attention140
fi