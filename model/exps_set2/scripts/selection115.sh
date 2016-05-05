#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection115/selection115.exp"
if [ -f $FPATH ]; then
	python experiment.py selection115 exps_set2/selection115
fi