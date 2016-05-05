#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention273/attention273.exp"
if [ -f $FPATH ]; then
	python experiment.py attention273 exps_set2/attention273
fi