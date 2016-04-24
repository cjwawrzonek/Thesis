#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined58/combined58.exp"
if [ -f $FPATH ]; then
	python experiment.py combined58 exps_set3/combined58
fi