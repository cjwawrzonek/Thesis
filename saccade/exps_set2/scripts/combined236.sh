#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined236/combined236.exp"
if [ -f $FPATH ]; then
	python experiment.py combined236 exps_set2/combined236
fi