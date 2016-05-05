#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined100/combined100.exp"
if [ -f $FPATH ]; then
	python experiment.py combined100 exps_set3/combined100
fi