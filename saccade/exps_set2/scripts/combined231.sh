#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined231/combined231.exp"
if [ -f $FPATH ]; then
	python experiment.py combined231 exps_set2/combined231
fi