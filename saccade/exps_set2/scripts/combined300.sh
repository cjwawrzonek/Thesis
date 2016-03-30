#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined300/combined300.exp"
if [ -f $FPATH ]; then
	python experiment.py combined300 exps_set2/combined300
fi