#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined40/combined40.exp"
if [ -f $FPATH ]; then
	python experiment.py combined40 exps_set3/combined40
fi