#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined149/combined149.exp"
if [ -f $FPATH ]; then
	python experiment.py combined149 exps_set2/combined149
fi