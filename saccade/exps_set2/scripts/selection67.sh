#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection67/selection67.exp"
if [ -f $FPATH ]; then
	python experiment.py selection67 exps_set2/selection67
fi