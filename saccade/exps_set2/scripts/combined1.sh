#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined1/combined1.exp"
if [ -f $FPATH ]; then
	python experiment.py combined1 exps_set2/combined1
fi