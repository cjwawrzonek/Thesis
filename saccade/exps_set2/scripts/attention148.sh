#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention148/attention148.exp"
if [ -f $FPATH ]; then
	python experiment.py attention148 exps_set2/attention148
fi