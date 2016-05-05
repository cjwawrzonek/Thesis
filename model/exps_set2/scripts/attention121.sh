#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention121/attention121.exp"
if [ -f $FPATH ]; then
	python experiment.py attention121 exps_set2/attention121
fi