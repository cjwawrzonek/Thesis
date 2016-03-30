#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined6/combined6.exp"
if [ -f $FPATH ]; then
	python experiment.py combined6 exps_set2/combined6
fi