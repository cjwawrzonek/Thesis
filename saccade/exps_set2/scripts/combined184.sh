#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined184/combined184.exp"
if [ -f $FPATH ]; then
	python experiment.py combined184 exps_set2/combined184
fi