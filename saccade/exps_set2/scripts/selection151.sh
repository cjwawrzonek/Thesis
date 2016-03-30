#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection151/selection151.exp"
if [ -f $FPATH ]; then
	python experiment.py selection151 exps_set2/selection151
fi