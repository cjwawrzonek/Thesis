#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined128/combined128.exp"
if [ -f $FPATH ]; then
	python experiment.py combined128 exps_set2/combined128
fi