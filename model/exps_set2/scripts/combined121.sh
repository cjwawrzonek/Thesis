#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined121/combined121.exp"
if [ -f $FPATH ]; then
	python experiment.py combined121 exps_set2/combined121
fi