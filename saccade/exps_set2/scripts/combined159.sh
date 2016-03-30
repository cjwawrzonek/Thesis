#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined159/combined159.exp"
if [ -f $FPATH ]; then
	python experiment.py combined159 exps_set2/combined159
fi