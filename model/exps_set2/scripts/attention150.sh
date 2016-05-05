#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention150/attention150.exp"
if [ -f $FPATH ]; then
	python experiment.py attention150 exps_set2/attention150
fi