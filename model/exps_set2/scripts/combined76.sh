#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined76/combined76.exp"
if [ -f $FPATH ]; then
	python experiment.py combined76 exps_set2/combined76
fi