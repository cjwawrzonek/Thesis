#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection157/selection157.exp"
if [ -f $FPATH ]; then
	python experiment.py selection157 exps_set2/selection157
fi