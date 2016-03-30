#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection251/selection251.exp"
if [ -f $FPATH ]; then
	python experiment.py selection251 exps_set2/selection251
fi