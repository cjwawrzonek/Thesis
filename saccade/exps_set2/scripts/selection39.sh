#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection39/selection39.exp"
if [ -f $FPATH ]; then
	python experiment.py selection39 exps_set2/selection39
fi