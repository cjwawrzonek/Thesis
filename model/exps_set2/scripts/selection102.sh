#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection102/selection102.exp"
if [ -f $FPATH ]; then
	python experiment.py selection102 exps_set2/selection102
fi