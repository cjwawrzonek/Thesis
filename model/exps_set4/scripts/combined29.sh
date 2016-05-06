#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined29/combined29.exp"
if [ -f $FPATH ]; then
	python experiment.py combined29 exps_set4/combined29
fi