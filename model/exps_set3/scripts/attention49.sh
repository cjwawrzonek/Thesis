#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention49/attention49.exp"
if [ -f $FPATH ]; then
	python experiment.py attention49 exps_set3/attention49
fi