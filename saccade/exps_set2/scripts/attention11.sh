#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention11/attention11.exp"
if [ -f $FPATH ]; then
	python experiment.py attention11 exps_set2/attention11
fi