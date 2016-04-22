#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection52/selection52.exp"
if [ -f $FPATH ]; then
	python experiment.py selection52 exps_set3/selection52
fi