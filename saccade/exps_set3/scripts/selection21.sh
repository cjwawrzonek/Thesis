#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection21/selection21.exp"
if [ -f $FPATH ]; then
	python experiment.py selection21 exps_set3/selection21
fi