#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection103/selection103.exp"
if [ -f $FPATH ]; then
	python experiment.py selection103 exps_set2/selection103
fi