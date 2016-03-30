#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection107/selection107.exp"
if [ -f $FPATH ]; then
	python experiment.py selection107 exps_set2/selection107
fi