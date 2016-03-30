#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection158/selection158.exp"
if [ -f $FPATH ]; then
	python experiment.py selection158 exps_set2/selection158
fi