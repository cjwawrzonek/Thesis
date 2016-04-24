#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection67/selection67.exp"
if [ -f $FPATH ]; then
	python experiment.py selection67 exps_set3/selection67
fi