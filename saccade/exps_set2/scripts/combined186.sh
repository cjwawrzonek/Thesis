#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined186/combined186.exp"
if [ -f $FPATH ]; then
	python experiment.py combined186 exps_set2/combined186
fi