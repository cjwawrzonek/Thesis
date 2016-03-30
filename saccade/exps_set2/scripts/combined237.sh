#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined237/combined237.exp"
if [ -f $FPATH ]; then
	python experiment.py combined237 exps_set2/combined237
fi