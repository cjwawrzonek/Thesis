#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention86/attention86.exp"
if [ -f $FPATH ]; then
	python experiment.py attention86 exps_set4/attention86
fi