#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection144/selection144.exp"
if [ -f $FPATH ]; then
	python experiment.py selection144 exps_set2/selection144
fi