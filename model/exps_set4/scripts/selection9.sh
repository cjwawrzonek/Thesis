#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection9/selection9.exp"
if [ -f $FPATH ]; then
	python experiment.py selection9 exps_set4/selection9
fi