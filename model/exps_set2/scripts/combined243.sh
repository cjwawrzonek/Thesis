#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined243/combined243.exp"
if [ -f $FPATH ]; then
	python experiment.py combined243 exps_set2/combined243
fi