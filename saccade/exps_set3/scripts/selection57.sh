#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection57/selection57.exp"
if [ -f $FPATH ]; then
	python experiment.py selection57 exps_set3/selection57
fi