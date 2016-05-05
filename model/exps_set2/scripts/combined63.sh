#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined63/combined63.exp"
if [ -f $FPATH ]; then
	python experiment.py combined63 exps_set2/combined63
fi