#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention79/attention79.exp"
if [ -f $FPATH ]; then
	python experiment.py attention79 exps_set4/attention79
fi