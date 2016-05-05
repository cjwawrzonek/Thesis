#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined75/combined75.exp"
if [ -f $FPATH ]; then
	python experiment.py combined75 exps_set2/combined75
fi