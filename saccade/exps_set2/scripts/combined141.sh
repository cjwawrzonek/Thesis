#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined141/combined141.exp"
if [ -f $FPATH ]; then
	python experiment.py combined141 exps_set2/combined141
fi