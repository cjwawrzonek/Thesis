#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined101/combined101.exp"
if [ -f $FPATH ]; then
	python experiment.py combined101 exps_set2/combined101
fi