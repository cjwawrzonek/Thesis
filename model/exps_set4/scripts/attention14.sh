#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention14/attention14.exp"
if [ -f $FPATH ]; then
	python experiment.py attention14 exps_set4/attention14
fi