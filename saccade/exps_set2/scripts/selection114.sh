#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection114/selection114.exp"
if [ -f $FPATH ]; then
	python experiment.py selection114 exps_set2/selection114
fi