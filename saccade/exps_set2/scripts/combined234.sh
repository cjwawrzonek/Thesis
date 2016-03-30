#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined234/combined234.exp"
if [ -f $FPATH ]; then
	python experiment.py combined234 exps_set2/combined234
fi