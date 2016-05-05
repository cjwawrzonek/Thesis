#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined5/combined5.exp"
if [ -f $FPATH ]; then
	python experiment.py combined5 exps_set2/combined5
fi