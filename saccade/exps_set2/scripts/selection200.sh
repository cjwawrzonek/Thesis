#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection200/selection200.exp"
if [ -f $FPATH ]; then
	python experiment.py selection200 exps_set2/selection200
fi