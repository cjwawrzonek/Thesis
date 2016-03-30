#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection254/selection254.exp"
if [ -f $FPATH ]; then
	python experiment.py selection254 exps_set2/selection254
fi