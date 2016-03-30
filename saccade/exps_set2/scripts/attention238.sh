#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention238/attention238.exp"
if [ -f $FPATH ]; then
	python experiment.py attention238 exps_set2/attention238
fi