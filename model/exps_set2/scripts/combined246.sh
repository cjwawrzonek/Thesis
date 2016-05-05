#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined246/combined246.exp"
if [ -f $FPATH ]; then
	python experiment.py combined246 exps_set2/combined246
fi