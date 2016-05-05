#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined157/combined157.exp"
if [ -f $FPATH ]; then
	python experiment.py combined157 exps_set2/combined157
fi