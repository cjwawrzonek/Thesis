#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined117/combined117.exp"
if [ -f $FPATH ]; then
	python experiment.py combined117 exps_set2/combined117
fi