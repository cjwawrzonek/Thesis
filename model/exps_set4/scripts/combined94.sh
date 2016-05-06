#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined94/combined94.exp"
if [ -f $FPATH ]; then
	python experiment.py combined94 exps_set4/combined94
fi