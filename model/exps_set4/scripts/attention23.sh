#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention23/attention23.exp"
if [ -f $FPATH ]; then
	python experiment.py attention23 exps_set4/attention23
fi