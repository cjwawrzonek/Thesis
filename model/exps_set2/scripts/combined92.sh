#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined92/combined92.exp"
if [ -f $FPATH ]; then
	python experiment.py combined92 exps_set2/combined92
fi