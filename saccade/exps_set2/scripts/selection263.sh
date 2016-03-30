#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection263/selection263.exp"
if [ -f $FPATH ]; then
	python experiment.py selection263 exps_set2/selection263
fi