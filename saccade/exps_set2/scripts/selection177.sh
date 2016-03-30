#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection177/selection177.exp"
if [ -f $FPATH ]; then
	python experiment.py selection177 exps_set2/selection177
fi