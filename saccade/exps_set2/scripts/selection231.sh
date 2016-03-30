#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection231/selection231.exp"
if [ -f $FPATH ]; then
	python experiment.py selection231 exps_set2/selection231
fi