#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection41/selection41.exp"
if [ -f $FPATH ]; then
	python experiment.py selection41 exps_set4/selection41
fi