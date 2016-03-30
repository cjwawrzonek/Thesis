#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection236/selection236.exp"
if [ -f $FPATH ]; then
	python experiment.py selection236 exps_set2/selection236
fi