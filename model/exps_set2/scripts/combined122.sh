#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined122/combined122.exp"
if [ -f $FPATH ]; then
	python experiment.py combined122 exps_set2/combined122
fi