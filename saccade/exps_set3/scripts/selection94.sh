#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection94/selection94.exp"
if [ -f $FPATH ]; then
	python experiment.py selection94 exps_set3/selection94
fi