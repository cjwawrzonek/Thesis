#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention166/attention166.exp"
if [ -f $FPATH ]; then
	python experiment.py attention166 exps_set2/attention166
fi