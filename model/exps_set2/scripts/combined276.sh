#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined276/combined276.exp"
if [ -f $FPATH ]; then
	python experiment.py combined276 exps_set2/combined276
fi