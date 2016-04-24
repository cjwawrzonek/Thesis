#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined41/combined41.exp"
if [ -f $FPATH ]; then
	python experiment.py combined41 exps_set3/combined41
fi