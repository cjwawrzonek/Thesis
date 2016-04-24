#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined84/combined84.exp"
if [ -f $FPATH ]; then
	python experiment.py combined84 exps_set3/combined84
fi