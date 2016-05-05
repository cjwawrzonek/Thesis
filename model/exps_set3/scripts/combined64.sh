#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined64/combined64.exp"
if [ -f $FPATH ]; then
	python experiment.py combined64 exps_set3/combined64
fi