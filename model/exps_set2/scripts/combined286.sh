#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined286/combined286.exp"
if [ -f $FPATH ]; then
	python experiment.py combined286 exps_set2/combined286
fi