#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined36/combined36.exp"
if [ -f $FPATH ]; then
	python experiment.py combined36 exps_set2/combined36
fi