#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined169/combined169.exp"
if [ -f $FPATH ]; then
	python experiment.py combined169 exps_set2/combined169
fi