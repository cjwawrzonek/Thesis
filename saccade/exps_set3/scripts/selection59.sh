#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection59/selection59.exp"
if [ -f $FPATH ]; then
	python experiment.py selection59 exps_set3/selection59
fi