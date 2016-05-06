#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined13/combined13.exp"
if [ -f $FPATH ]; then
	python experiment.py combined13 exps_set4/combined13
fi