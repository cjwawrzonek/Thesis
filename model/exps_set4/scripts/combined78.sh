#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined78/combined78.exp"
if [ -f $FPATH ]; then
	python experiment.py combined78 exps_set4/combined78
fi