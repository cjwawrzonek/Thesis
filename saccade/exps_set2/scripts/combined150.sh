#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined150/combined150.exp"
if [ -f $FPATH ]; then
	python experiment.py combined150 exps_set2/combined150
fi