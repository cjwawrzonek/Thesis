#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention50/attention50.exp"
if [ -f $FPATH ]; then
	python experiment.py attention50 exps_set3/attention50
fi