#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined285/combined285.exp"
if [ -f $FPATH ]; then
	python experiment.py combined285 exps_set2/combined285
fi