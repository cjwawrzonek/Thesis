#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined204/combined204.exp"
if [ -f $FPATH ]; then
	python experiment.py combined204 exps_set2/combined204
fi