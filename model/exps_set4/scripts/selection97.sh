#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection97/selection97.exp"
if [ -f $FPATH ]; then
	python experiment.py selection97 exps_set4/selection97
fi