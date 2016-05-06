#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined81/combined81.exp"
if [ -f $FPATH ]; then
	python experiment.py combined81 exps_set4/combined81
fi