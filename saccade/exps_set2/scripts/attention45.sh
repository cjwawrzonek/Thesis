#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention45/attention45.exp"
if [ -f $FPATH ]; then
	python experiment.py attention45 exps_set2/attention45
fi