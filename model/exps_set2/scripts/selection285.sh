#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection285/selection285.exp"
if [ -f $FPATH ]; then
	python experiment.py selection285 exps_set2/selection285
fi