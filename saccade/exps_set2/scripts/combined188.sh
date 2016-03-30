#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined188/combined188.exp"
if [ -f $FPATH ]; then
	python experiment.py combined188 exps_set2/combined188
fi