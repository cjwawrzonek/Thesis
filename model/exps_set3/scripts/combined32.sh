#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined32/combined32.exp"
if [ -f $FPATH ]; then
	python experiment.py combined32 exps_set3/combined32
fi