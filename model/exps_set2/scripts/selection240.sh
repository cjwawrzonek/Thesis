#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection240/selection240.exp"
if [ -f $FPATH ]; then
	python experiment.py selection240 exps_set2/selection240
fi