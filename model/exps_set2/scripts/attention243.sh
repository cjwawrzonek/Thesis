#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention243/attention243.exp"
if [ -f $FPATH ]; then
	python experiment.py attention243 exps_set2/attention243
fi