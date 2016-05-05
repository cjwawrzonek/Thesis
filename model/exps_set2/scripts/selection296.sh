#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection296/selection296.exp"
if [ -f $FPATH ]; then
	python experiment.py selection296 exps_set2/selection296
fi