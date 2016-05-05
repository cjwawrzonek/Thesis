#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection210/selection210.exp"
if [ -f $FPATH ]; then
	python experiment.py selection210 exps_set2/selection210
fi