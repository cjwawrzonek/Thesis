#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined206/combined206.exp"
if [ -f $FPATH ]; then
	python experiment.py combined206 exps_set2/combined206
fi