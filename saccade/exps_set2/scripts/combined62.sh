#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined62/combined62.exp"
if [ -f $FPATH ]; then
	python experiment.py combined62 exps_set2/combined62
fi