#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection19/selection19.exp"
if [ -f $FPATH ]; then
	python experiment.py selection19 exps_set4/selection19
fi