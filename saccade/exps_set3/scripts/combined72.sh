#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined72/combined72.exp"
if [ -f $FPATH ]; then
	python experiment.py combined72 exps_set3/combined72
fi