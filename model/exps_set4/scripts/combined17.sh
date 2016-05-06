#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined17/combined17.exp"
if [ -f $FPATH ]; then
	python experiment.py combined17 exps_set4/combined17
fi