#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection11/selection11.exp"
if [ -f $FPATH ]; then
	python experiment.py selection11 exps_set2/selection11
fi