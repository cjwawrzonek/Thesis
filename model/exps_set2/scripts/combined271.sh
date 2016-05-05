#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined271/combined271.exp"
if [ -f $FPATH ]; then
	python experiment.py combined271 exps_set2/combined271
fi