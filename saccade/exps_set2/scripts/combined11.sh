#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined11/combined11.exp"
if [ -f $FPATH ]; then
	python experiment.py combined11 exps_set2/combined11
fi