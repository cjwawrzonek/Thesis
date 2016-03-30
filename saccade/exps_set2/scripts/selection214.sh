#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection214/selection214.exp"
if [ -f $FPATH ]; then
	python experiment.py selection214 exps_set2/selection214
fi