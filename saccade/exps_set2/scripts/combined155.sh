#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined155/combined155.exp"
if [ -f $FPATH ]; then
	python experiment.py combined155 exps_set2/combined155
fi