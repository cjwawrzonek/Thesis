#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection42/selection42.exp"
if [ -f $FPATH ]; then
	python experiment.py selection42 exps_set3/selection42
fi