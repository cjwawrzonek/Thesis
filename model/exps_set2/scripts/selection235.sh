#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection235/selection235.exp"
if [ -f $FPATH ]; then
	python experiment.py selection235 exps_set2/selection235
fi