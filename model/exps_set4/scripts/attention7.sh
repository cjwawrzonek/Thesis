#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention7/attention7.exp"
if [ -f $FPATH ]; then
	python experiment.py attention7 exps_set4/attention7
fi