#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined290/combined290.exp"
if [ -f $FPATH ]; then
	python experiment.py combined290 exps_set2/combined290
fi