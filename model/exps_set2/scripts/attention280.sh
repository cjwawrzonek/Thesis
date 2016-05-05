#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention280/attention280.exp"
if [ -f $FPATH ]; then
	python experiment.py attention280 exps_set2/attention280
fi