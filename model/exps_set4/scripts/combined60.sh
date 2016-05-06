#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined60/combined60.exp"
if [ -f $FPATH ]; then
	python experiment.py combined60 exps_set4/combined60
fi