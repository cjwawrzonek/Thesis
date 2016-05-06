#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined66/combined66.exp"
if [ -f $FPATH ]; then
	python experiment.py combined66 exps_set4/combined66
fi