#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined74/combined74.exp"
if [ -f $FPATH ]; then
	python experiment.py combined74 exps_set3/combined74
fi