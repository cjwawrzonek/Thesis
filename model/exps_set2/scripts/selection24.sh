#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection24/selection24.exp"
if [ -f $FPATH ]; then
	python experiment.py selection24 exps_set2/selection24
fi