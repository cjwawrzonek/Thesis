#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined222/combined222.exp"
if [ -f $FPATH ]; then
	python experiment.py combined222 exps_set2/combined222
fi