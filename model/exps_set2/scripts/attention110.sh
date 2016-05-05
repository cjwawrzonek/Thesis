#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention110/attention110.exp"
if [ -f $FPATH ]; then
	python experiment.py attention110 exps_set2/attention110
fi