#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection69/selection69.exp"
if [ -f $FPATH ]; then
	python experiment.py selection69 exps_set3/selection69
fi