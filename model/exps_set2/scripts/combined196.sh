#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined196/combined196.exp"
if [ -f $FPATH ]; then
	python experiment.py combined196 exps_set2/combined196
fi