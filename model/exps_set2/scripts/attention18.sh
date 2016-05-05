#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention18/attention18.exp"
if [ -f $FPATH ]; then
	python experiment.py attention18 exps_set2/attention18
fi