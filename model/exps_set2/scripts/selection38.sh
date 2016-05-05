#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection38/selection38.exp"
if [ -f $FPATH ]; then
	python experiment.py selection38 exps_set2/selection38
fi