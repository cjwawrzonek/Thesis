#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection130/selection130.exp"
if [ -f $FPATH ]; then
	python experiment.py selection130 exps_set2/selection130
fi