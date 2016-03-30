#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection155/selection155.exp"
if [ -f $FPATH ]; then
	python experiment.py selection155 exps_set2/selection155
fi