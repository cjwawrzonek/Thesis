#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined241/combined241.exp"
if [ -f $FPATH ]; then
	python experiment.py combined241 exps_set2/combined241
fi