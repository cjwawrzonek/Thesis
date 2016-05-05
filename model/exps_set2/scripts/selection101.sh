#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection101/selection101.exp"
if [ -f $FPATH ]; then
	python experiment.py selection101 exps_set2/selection101
fi