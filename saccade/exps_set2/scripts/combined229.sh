#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined229/combined229.exp"
if [ -f $FPATH ]; then
	python experiment.py combined229 exps_set2/combined229
fi