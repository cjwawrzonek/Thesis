#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined99/combined99.exp"
if [ -f $FPATH ]; then
	python experiment.py combined99 exps_set3/combined99
fi