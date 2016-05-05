#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention141/attention141.exp"
if [ -f $FPATH ]; then
	python experiment.py attention141 exps_set2/attention141
fi