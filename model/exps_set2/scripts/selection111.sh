#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection111/selection111.exp"
if [ -f $FPATH ]; then
	python experiment.py selection111 exps_set2/selection111
fi