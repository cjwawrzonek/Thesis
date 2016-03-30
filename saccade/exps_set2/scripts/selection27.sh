#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection27/selection27.exp"
if [ -f $FPATH ]; then
	python experiment.py selection27 exps_set2/selection27
fi