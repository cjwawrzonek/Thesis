#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined45/combined45.exp"
if [ -f $FPATH ]; then
	python experiment.py combined45 exps_set3/combined45
fi