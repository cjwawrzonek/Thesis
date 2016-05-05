#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention265/attention265.exp"
if [ -f $FPATH ]; then
	python experiment.py attention265 exps_set2/attention265
fi