#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection40/selection40.exp"
if [ -f $FPATH ]; then
	python experiment.py selection40 exps_set4/selection40
fi