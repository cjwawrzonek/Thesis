#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined37/combined37.exp"
if [ -f $FPATH ]; then
	python experiment.py combined37 exps_set3/combined37
fi