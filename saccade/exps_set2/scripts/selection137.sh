#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection137/selection137.exp"
if [ -f $FPATH ]; then
	python experiment.py selection137 exps_set2/selection137
fi