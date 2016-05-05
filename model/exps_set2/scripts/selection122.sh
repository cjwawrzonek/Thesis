#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection122/selection122.exp"
if [ -f $FPATH ]; then
	python experiment.py selection122 exps_set2/selection122
fi