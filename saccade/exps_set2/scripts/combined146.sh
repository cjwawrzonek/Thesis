#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined146/combined146.exp"
if [ -f $FPATH ]; then
	python experiment.py combined146 exps_set2/combined146
fi