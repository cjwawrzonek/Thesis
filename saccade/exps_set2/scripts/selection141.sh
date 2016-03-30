#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection141/selection141.exp"
if [ -f $FPATH ]; then
	python experiment.py selection141 exps_set2/selection141
fi