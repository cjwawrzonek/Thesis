#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention192/attention192.exp"
if [ -f $FPATH ]; then
	python experiment.py attention192 exps_set2/attention192
fi