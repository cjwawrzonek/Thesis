#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection99/selection99.exp"
if [ -f $FPATH ]; then
	python experiment.py selection99 exps_set2/selection99
fi