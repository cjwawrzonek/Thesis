#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection180/selection180.exp"
if [ -f $FPATH ]; then
	python experiment.py selection180 exps_set2/selection180
fi