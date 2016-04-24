#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined24/combined24.exp"
if [ -f $FPATH ]; then
	python experiment.py combined24 exps_set3/combined24
fi