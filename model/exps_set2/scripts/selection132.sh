#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection132/selection132.exp"
if [ -f $FPATH ]; then
	python experiment.py selection132 exps_set2/selection132
fi