#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined137/combined137.exp"
if [ -f $FPATH ]; then
	python experiment.py combined137 exps_set2/combined137
fi