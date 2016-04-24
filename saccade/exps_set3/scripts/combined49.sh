#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined49/combined49.exp"
if [ -f $FPATH ]; then
	python experiment.py combined49 exps_set3/combined49
fi