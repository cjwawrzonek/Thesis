#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection71/selection71.exp"
if [ -f $FPATH ]; then
	python experiment.py selection71 exps_set2/selection71
fi