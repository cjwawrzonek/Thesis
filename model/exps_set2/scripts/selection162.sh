#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection162/selection162.exp"
if [ -f $FPATH ]; then
	python experiment.py selection162 exps_set2/selection162
fi