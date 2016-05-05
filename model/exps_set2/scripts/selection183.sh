#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection183/selection183.exp"
if [ -f $FPATH ]; then
	python experiment.py selection183 exps_set2/selection183
fi