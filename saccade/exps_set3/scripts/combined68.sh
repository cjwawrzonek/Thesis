#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined68/combined68.exp"
if [ -f $FPATH ]; then
	python experiment.py combined68 exps_set3/combined68
fi