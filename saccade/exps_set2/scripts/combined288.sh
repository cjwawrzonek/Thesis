#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined288/combined288.exp"
if [ -f $FPATH ]; then
	python experiment.py combined288 exps_set2/combined288
fi