#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined264/combined264.exp"
if [ -f $FPATH ]; then
	python experiment.py combined264 exps_set2/combined264
fi