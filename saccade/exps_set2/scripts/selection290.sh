#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection290/selection290.exp"
if [ -f $FPATH ]; then
	python experiment.py selection290 exps_set2/selection290
fi