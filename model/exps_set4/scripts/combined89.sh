#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined89/combined89.exp"
if [ -f $FPATH ]; then
	python experiment.py combined89 exps_set4/combined89
fi