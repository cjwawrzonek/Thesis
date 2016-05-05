#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection128/selection128.exp"
if [ -f $FPATH ]; then
	python experiment.py selection128 exps_set2/selection128
fi