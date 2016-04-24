#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention18/attention18.exp"
if [ -f $FPATH ]; then
	python experiment.py attention18 exps_set3/attention18
fi