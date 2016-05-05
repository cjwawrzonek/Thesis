#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection16/selection16.exp"
if [ -f $FPATH ]; then
	python experiment.py selection16 exps_set3/selection16
fi