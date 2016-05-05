#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection110/selection110.exp"
if [ -f $FPATH ]; then
	python experiment.py selection110 exps_set2/selection110
fi