#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined2/combined2.exp"
if [ -f $FPATH ]; then
	python experiment.py combined2 exps_set2/combined2
fi