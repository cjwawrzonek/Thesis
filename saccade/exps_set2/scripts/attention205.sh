#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention205/attention205.exp"
if [ -f $FPATH ]; then
	python experiment.py attention205 exps_set2/attention205
fi