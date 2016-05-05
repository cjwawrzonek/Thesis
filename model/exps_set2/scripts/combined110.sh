#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined110/combined110.exp"
if [ -f $FPATH ]; then
	python experiment.py combined110 exps_set2/combined110
fi