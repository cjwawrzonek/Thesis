#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined180/combined180.exp"
if [ -f $FPATH ]; then
	python experiment.py combined180 exps_set2/combined180
fi