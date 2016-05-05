#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention211/attention211.exp"
if [ -f $FPATH ]; then
	python experiment.py attention211 exps_set2/attention211
fi