#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined53/combined53.exp"
if [ -f $FPATH ]; then
	python experiment.py combined53 exps_set3/combined53
fi