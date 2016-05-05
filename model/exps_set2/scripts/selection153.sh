#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection153/selection153.exp"
if [ -f $FPATH ]; then
	python experiment.py selection153 exps_set2/selection153
fi