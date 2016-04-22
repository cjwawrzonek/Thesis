#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention15/attention15.exp"
if [ -f $FPATH ]; then
	python experiment.py attention15 exps_set3/attention15
fi