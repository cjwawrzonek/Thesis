#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined33/combined33.exp"
if [ -f $FPATH ]; then
	python experiment.py combined33 exps_set3/combined33
fi