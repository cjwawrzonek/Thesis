#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection88/selection88.exp"
if [ -f $FPATH ]; then
	python experiment.py selection88 exps_set2/selection88
fi