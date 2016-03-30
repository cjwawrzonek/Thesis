#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection45/selection45.exp"
if [ -f $FPATH ]; then
	python experiment.py selection45 exps_set2/selection45
fi