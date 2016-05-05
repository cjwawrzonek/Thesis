#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined114/combined114.exp"
if [ -f $FPATH ]; then
	python experiment.py combined114 exps_set2/combined114
fi