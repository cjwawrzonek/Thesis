#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection62/selection62.exp"
if [ -f $FPATH ]; then
	python experiment.py selection62 exps_set3/selection62
fi