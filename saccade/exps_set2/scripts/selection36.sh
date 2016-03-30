#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection36/selection36.exp"
if [ -f $FPATH ]; then
	python experiment.py selection36 exps_set2/selection36
fi