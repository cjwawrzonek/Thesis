#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection136/selection136.exp"
if [ -f $FPATH ]; then
	python experiment.py selection136 exps_set2/selection136
fi