#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined283/combined283.exp"
if [ -f $FPATH ]; then
	python experiment.py combined283 exps_set2/combined283
fi