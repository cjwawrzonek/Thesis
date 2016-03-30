#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined164/combined164.exp"
if [ -f $FPATH ]; then
	python experiment.py combined164 exps_set2/combined164
fi