#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined275/combined275.exp"
if [ -f $FPATH ]; then
	python experiment.py combined275 exps_set2/combined275
fi