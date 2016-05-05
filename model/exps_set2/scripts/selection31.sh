#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection31/selection31.exp"
if [ -f $FPATH ]; then
	python experiment.py selection31 exps_set2/selection31
fi