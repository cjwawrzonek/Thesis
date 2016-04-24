#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined38/combined38.exp"
if [ -f $FPATH ]; then
	python experiment.py combined38 exps_set3/combined38
fi