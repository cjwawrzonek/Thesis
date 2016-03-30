#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection176/selection176.exp"
if [ -f $FPATH ]; then
	python experiment.py selection176 exps_set2/selection176
fi