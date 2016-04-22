#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection83/selection83.exp"
if [ -f $FPATH ]; then
	python experiment.py selection83 exps_set3/selection83
fi