#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined230/combined230.exp"
if [ -f $FPATH ]; then
	python experiment.py combined230 exps_set2/combined230
fi