#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined43/combined43.exp"
if [ -f $FPATH ]; then
	python experiment.py combined43 exps_set2/combined43
fi