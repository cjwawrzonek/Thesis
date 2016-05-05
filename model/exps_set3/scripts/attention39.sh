#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention39/attention39.exp"
if [ -f $FPATH ]; then
	python experiment.py attention39 exps_set3/attention39
fi