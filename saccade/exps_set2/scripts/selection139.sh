#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection139/selection139.exp"
if [ -f $FPATH ]; then
	python experiment.py selection139 exps_set2/selection139
fi