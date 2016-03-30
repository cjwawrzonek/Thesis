#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection196/selection196.exp"
if [ -f $FPATH ]; then
	python experiment.py selection196 exps_set2/selection196
fi