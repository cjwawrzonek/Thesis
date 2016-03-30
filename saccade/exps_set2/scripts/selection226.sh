#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection226/selection226.exp"
if [ -f $FPATH ]; then
	python experiment.py selection226 exps_set2/selection226
fi