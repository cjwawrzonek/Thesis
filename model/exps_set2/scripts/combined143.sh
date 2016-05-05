#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined143/combined143.exp"
if [ -f $FPATH ]; then
	python experiment.py combined143 exps_set2/combined143
fi