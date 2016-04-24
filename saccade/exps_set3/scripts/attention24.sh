#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention24/attention24.exp"
if [ -f $FPATH ]; then
	python experiment.py attention24 exps_set3/attention24
fi