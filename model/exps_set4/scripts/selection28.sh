#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection28/selection28.exp"
if [ -f $FPATH ]; then
	python experiment.py selection28 exps_set4/selection28
fi