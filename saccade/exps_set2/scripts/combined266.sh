#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined266/combined266.exp"
if [ -f $FPATH ]; then
	python experiment.py combined266 exps_set2/combined266
fi