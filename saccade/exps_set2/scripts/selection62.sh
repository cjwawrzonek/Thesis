#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection62/selection62.exp"
if [ -f $FPATH ]; then
	python experiment.py selection62 exps_set2/selection62
fi