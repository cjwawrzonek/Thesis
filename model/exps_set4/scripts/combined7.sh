#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined7/combined7.exp"
if [ -f $FPATH ]; then
	python experiment.py combined7 exps_set4/combined7
fi