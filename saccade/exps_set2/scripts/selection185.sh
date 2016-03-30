#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection185/selection185.exp"
if [ -f $FPATH ]; then
	python experiment.py selection185 exps_set2/selection185
fi