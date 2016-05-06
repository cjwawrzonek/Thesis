#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined15/combined15.exp"
if [ -f $FPATH ]; then
	python experiment.py combined15 exps_set4/combined15
fi