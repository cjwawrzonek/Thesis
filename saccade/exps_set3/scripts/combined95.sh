#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined95/combined95.exp"
if [ -f $FPATH ]; then
	python experiment.py combined95 exps_set3/combined95
fi