#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection171/selection171.exp"
if [ -f $FPATH ]; then
	python experiment.py selection171 exps_set2/selection171
fi