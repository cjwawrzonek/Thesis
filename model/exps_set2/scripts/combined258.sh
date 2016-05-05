#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined258/combined258.exp"
if [ -f $FPATH ]; then
	python experiment.py combined258 exps_set2/combined258
fi