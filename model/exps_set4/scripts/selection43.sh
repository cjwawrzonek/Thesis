#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection43/selection43.exp"
if [ -f $FPATH ]; then
	python experiment.py selection43 exps_set4/selection43
fi