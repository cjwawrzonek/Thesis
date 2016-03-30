#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined208/combined208.exp"
if [ -f $FPATH ]; then
	python experiment.py combined208 exps_set2/combined208
fi