#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined90/combined90.exp"
if [ -f $FPATH ]; then
	python experiment.py combined90 exps_set2/combined90
fi