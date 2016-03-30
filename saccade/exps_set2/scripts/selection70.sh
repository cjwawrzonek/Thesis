#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection70/selection70.exp"
if [ -f $FPATH ]; then
	python experiment.py selection70 exps_set2/selection70
fi