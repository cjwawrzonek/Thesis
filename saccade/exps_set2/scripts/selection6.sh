#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection6/selection6.exp"
if [ -f $FPATH ]; then
	python experiment.py selection6 exps_set2/selection6
fi