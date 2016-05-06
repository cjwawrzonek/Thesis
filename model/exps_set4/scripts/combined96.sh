#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined96/combined96.exp"
if [ -f $FPATH ]; then
	python experiment.py combined96 exps_set4/combined96
fi