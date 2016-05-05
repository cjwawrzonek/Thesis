#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection192/selection192.exp"
if [ -f $FPATH ]; then
	python experiment.py selection192 exps_set2/selection192
fi