#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection87/selection87.exp"
if [ -f $FPATH ]; then
	python experiment.py selection87 exps_set3/selection87
fi