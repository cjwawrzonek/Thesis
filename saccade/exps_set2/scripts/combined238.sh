#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined238/combined238.exp"
if [ -f $FPATH ]; then
	python experiment.py combined238 exps_set2/combined238
fi