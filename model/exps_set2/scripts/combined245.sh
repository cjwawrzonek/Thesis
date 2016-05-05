#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined245/combined245.exp"
if [ -f $FPATH ]; then
	python experiment.py combined245 exps_set2/combined245
fi