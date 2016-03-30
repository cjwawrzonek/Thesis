#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined273/combined273.exp"
if [ -f $FPATH ]; then
	python experiment.py combined273 exps_set2/combined273
fi