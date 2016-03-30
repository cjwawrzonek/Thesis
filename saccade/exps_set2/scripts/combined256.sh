#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined256/combined256.exp"
if [ -f $FPATH ]; then
	python experiment.py combined256 exps_set2/combined256
fi