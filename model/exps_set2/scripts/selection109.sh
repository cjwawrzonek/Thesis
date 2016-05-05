#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection109/selection109.exp"
if [ -f $FPATH ]; then
	python experiment.py selection109 exps_set2/selection109
fi