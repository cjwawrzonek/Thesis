#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection279/selection279.exp"
if [ -f $FPATH ]; then
	python experiment.py selection279 exps_set2/selection279
fi