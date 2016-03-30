#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined166/combined166.exp"
if [ -f $FPATH ]; then
	python experiment.py combined166 exps_set2/combined166
fi