#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined3/combined3.exp"
if [ -f $FPATH ]; then
	python experiment.py combined3 exps_set4/combined3
fi