#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined239/combined239.exp"
if [ -f $FPATH ]; then
	python experiment.py combined239 exps_set2/combined239
fi