#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention24/attention24.exp"
if [ -f $FPATH ]; then
	python experiment.py attention24 exps_set2/attention24
fi