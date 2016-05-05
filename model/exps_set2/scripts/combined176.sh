#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined176/combined176.exp"
if [ -f $FPATH ]; then
	python experiment.py combined176 exps_set2/combined176
fi