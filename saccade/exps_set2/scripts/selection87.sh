#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection87/selection87.exp"
if [ -f $FPATH ]; then
	python experiment.py selection87 exps_set2/selection87
fi