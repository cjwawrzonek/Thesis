#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection6/selection6.exp"
if [ -f $FPATH ]; then
	python experiment.py selection6 exps_set4/selection6
fi