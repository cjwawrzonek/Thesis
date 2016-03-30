#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection124/selection124.exp"
if [ -f $FPATH ]; then
	python experiment.py selection124 exps_set2/selection124
fi