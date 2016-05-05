#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined267/combined267.exp"
if [ -f $FPATH ]; then
	python experiment.py combined267 exps_set2/combined267
fi