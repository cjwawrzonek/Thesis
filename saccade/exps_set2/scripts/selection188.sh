#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection188/selection188.exp"
if [ -f $FPATH ]; then
	python experiment.py selection188 exps_set2/selection188
fi