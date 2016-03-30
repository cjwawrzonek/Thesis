#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection230/selection230.exp"
if [ -f $FPATH ]; then
	python experiment.py selection230 exps_set2/selection230
fi