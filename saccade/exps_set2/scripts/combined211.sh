#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined211/combined211.exp"
if [ -f $FPATH ]; then
	python experiment.py combined211 exps_set2/combined211
fi