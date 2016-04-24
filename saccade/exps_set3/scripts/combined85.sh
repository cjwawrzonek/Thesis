#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined85/combined85.exp"
if [ -f $FPATH ]; then
	python experiment.py combined85 exps_set3/combined85
fi