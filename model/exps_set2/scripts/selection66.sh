#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection66/selection66.exp"
if [ -f $FPATH ]; then
	python experiment.py selection66 exps_set2/selection66
fi