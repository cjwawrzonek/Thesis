#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention112/attention112.exp"
if [ -f $FPATH ]; then
	python experiment.py attention112 exps_set2/attention112
fi