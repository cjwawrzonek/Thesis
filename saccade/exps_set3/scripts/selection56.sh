#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection56/selection56.exp"
if [ -f $FPATH ]; then
	python experiment.py selection56 exps_set3/selection56
fi