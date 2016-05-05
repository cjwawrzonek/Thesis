#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection166/selection166.exp"
if [ -f $FPATH ]; then
	python experiment.py selection166 exps_set2/selection166
fi