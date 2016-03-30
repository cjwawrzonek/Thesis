#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection259/selection259.exp"
if [ -f $FPATH ]; then
	python experiment.py selection259 exps_set2/selection259
fi