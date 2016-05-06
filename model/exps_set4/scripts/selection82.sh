#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection82/selection82.exp"
if [ -f $FPATH ]; then
	python experiment.py selection82 exps_set4/selection82
fi