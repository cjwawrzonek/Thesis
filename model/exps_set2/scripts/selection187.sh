#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection187/selection187.exp"
if [ -f $FPATH ]; then
	python experiment.py selection187 exps_set2/selection187
fi