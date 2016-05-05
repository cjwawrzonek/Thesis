#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection121/selection121.exp"
if [ -f $FPATH ]; then
	python experiment.py selection121 exps_set2/selection121
fi