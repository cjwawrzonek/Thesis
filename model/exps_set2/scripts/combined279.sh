#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined279/combined279.exp"
if [ -f $FPATH ]; then
	python experiment.py combined279 exps_set2/combined279
fi