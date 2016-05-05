#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention225/attention225.exp"
if [ -f $FPATH ]; then
	python experiment.py attention225 exps_set2/attention225
fi