#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention97/attention97.exp"
if [ -f $FPATH ]; then
	python experiment.py attention97 exps_set4/attention97
fi