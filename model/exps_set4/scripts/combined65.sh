#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined65/combined65.exp"
if [ -f $FPATH ]; then
	python experiment.py combined65 exps_set4/combined65
fi