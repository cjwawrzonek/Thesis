#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined247/combined247.exp"
if [ -f $FPATH ]; then
	python experiment.py combined247 exps_set2/combined247
fi