#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined240/combined240.exp"
if [ -f $FPATH ]; then
	python experiment.py combined240 exps_set2/combined240
fi