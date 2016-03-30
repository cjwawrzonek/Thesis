#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection146/selection146.exp"
if [ -f $FPATH ]; then
	python experiment.py selection146 exps_set2/selection146
fi