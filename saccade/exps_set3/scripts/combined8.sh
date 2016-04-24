#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined8/combined8.exp"
if [ -f $FPATH ]; then
	python experiment.py combined8 exps_set3/combined8
fi