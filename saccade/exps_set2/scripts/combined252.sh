#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined252/combined252.exp"
if [ -f $FPATH ]; then
	python experiment.py combined252 exps_set2/combined252
fi