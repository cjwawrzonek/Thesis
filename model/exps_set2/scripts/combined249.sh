#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined249/combined249.exp"
if [ -f $FPATH ]; then
	python experiment.py combined249 exps_set2/combined249
fi