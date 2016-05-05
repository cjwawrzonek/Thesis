#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection88/selection88.exp"
if [ -f $FPATH ]; then
	python experiment.py selection88 exps_set3/selection88
fi