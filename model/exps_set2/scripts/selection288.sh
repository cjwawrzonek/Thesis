#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection288/selection288.exp"
if [ -f $FPATH ]; then
	python experiment.py selection288 exps_set2/selection288
fi