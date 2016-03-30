#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined217/combined217.exp"
if [ -f $FPATH ]; then
	python experiment.py combined217 exps_set2/combined217
fi