#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection117/selection117.exp"
if [ -f $FPATH ]; then
	python experiment.py selection117 exps_set2/selection117
fi