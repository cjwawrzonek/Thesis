#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection152/selection152.exp"
if [ -f $FPATH ]; then
	python experiment.py selection152 exps_set2/selection152
fi