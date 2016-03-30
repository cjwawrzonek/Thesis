#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection113/selection113.exp"
if [ -f $FPATH ]; then
	python experiment.py selection113 exps_set2/selection113
fi