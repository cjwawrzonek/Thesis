#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined138/combined138.exp"
if [ -f $FPATH ]; then
	python experiment.py combined138 exps_set2/combined138
fi