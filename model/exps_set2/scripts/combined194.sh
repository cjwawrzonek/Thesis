#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined194/combined194.exp"
if [ -f $FPATH ]; then
	python experiment.py combined194 exps_set2/combined194
fi