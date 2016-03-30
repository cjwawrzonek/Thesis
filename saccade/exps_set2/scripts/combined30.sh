#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined30/combined30.exp"
if [ -f $FPATH ]; then
	python experiment.py combined30 exps_set2/combined30
fi