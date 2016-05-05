#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined123/combined123.exp"
if [ -f $FPATH ]; then
	python experiment.py combined123 exps_set2/combined123
fi