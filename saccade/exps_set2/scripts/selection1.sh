#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection1/selection1.exp"
if [ -f $FPATH ]; then
	python experiment.py selection1 exps_set2/selection1
fi