#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined28/combined28.exp"
if [ -f $FPATH ]; then
	python experiment.py combined28 exps_set4/combined28
fi