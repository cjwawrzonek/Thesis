#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined86/combined86.exp"
if [ -f $FPATH ]; then
	python experiment.py combined86 exps_set4/combined86
fi