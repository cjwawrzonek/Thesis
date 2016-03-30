#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection195/selection195.exp"
if [ -f $FPATH ]; then
	python experiment.py selection195 exps_set2/selection195
fi