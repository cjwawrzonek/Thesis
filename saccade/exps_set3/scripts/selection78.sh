#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection78/selection78.exp"
if [ -f $FPATH ]; then
	python experiment.py selection78 exps_set3/selection78
fi