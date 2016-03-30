#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined259/combined259.exp"
if [ -f $FPATH ]; then
	python experiment.py combined259 exps_set2/combined259
fi