#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined70/combined70.exp"
if [ -f $FPATH ]; then
	python experiment.py combined70 exps_set3/combined70
fi