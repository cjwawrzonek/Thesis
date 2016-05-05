#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection2/selection2.exp"
if [ -f $FPATH ]; then
	python experiment.py selection2 exps_set2/selection2
fi