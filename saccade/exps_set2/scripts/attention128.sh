#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention128/attention128.exp"
if [ -f $FPATH ]; then
	python experiment.py attention128 exps_set2/attention128
fi