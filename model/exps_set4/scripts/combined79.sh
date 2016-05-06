#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined79/combined79.exp"
if [ -f $FPATH ]; then
	python experiment.py combined79 exps_set4/combined79
fi