#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention214/attention214.exp"
if [ -f $FPATH ]; then
	python experiment.py attention214 exps_set2/attention214
fi