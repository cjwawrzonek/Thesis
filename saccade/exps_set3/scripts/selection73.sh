#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection73/selection73.exp"
if [ -f $FPATH ]; then
	python experiment.py selection73 exps_set3/selection73
fi