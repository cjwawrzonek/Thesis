#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention245/attention245.exp"
if [ -f $FPATH ]; then
	python experiment.py attention245 exps_set2/attention245
fi