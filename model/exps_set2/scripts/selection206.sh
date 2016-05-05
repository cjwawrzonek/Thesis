#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection206/selection206.exp"
if [ -f $FPATH ]; then
	python experiment.py selection206 exps_set2/selection206
fi