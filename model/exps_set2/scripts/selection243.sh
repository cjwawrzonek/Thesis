#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection243/selection243.exp"
if [ -f $FPATH ]; then
	python experiment.py selection243 exps_set2/selection243
fi