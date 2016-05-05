#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention17/attention17.exp"
if [ -f $FPATH ]; then
	python experiment.py attention17 exps_set3/attention17
fi