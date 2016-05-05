#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection134/selection134.exp"
if [ -f $FPATH ]; then
	python experiment.py selection134 exps_set2/selection134
fi