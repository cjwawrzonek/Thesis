#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined42/combined42.exp"
if [ -f $FPATH ]; then
	python experiment.py combined42 exps_set2/combined42
fi