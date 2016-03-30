#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention152/attention152.exp"
if [ -f $FPATH ]; then
	python experiment.py attention152 exps_set2/attention152
fi