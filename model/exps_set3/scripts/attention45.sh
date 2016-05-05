#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention45/attention45.exp"
if [ -f $FPATH ]; then
	python experiment.py attention45 exps_set3/attention45
fi