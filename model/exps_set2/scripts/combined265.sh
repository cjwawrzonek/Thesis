#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined265/combined265.exp"
if [ -f $FPATH ]; then
	python experiment.py combined265 exps_set2/combined265
fi