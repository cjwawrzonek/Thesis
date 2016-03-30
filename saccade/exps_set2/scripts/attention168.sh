#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention168/attention168.exp"
if [ -f $FPATH ]; then
	python experiment.py attention168 exps_set2/attention168
fi