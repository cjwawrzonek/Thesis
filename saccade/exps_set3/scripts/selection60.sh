#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection60/selection60.exp"
if [ -f $FPATH ]; then
	python experiment.py selection60 exps_set3/selection60
fi