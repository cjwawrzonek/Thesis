#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention58/attention58.exp"
if [ -f $FPATH ]; then
	python experiment.py attention58 exps_set3/attention58
fi