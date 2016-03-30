#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection49/selection49.exp"
if [ -f $FPATH ]; then
	python experiment.py selection49 exps_set2/selection49
fi