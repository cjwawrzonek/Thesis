#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection197/selection197.exp"
if [ -f $FPATH ]; then
	python experiment.py selection197 exps_set2/selection197
fi