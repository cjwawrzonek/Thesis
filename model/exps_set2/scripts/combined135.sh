#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined135/combined135.exp"
if [ -f $FPATH ]; then
	python experiment.py combined135 exps_set2/combined135
fi