#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined88/combined88.exp"
if [ -f $FPATH ]; then
	python experiment.py combined88 exps_set4/combined88
fi