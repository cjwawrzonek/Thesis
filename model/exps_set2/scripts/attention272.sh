#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention272/attention272.exp"
if [ -f $FPATH ]; then
	python experiment.py attention272 exps_set2/attention272
fi