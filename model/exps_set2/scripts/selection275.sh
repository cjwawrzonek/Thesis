#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection275/selection275.exp"
if [ -f $FPATH ]; then
	python experiment.py selection275 exps_set2/selection275
fi