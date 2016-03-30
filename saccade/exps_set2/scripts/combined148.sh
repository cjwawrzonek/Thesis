#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined148/combined148.exp"
if [ -f $FPATH ]; then
	python experiment.py combined148 exps_set2/combined148
fi