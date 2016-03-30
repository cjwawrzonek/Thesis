#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection265/selection265.exp"
if [ -f $FPATH ]; then
	python experiment.py selection265 exps_set2/selection265
fi