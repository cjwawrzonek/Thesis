#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection190/selection190.exp"
if [ -f $FPATH ]; then
	python experiment.py selection190 exps_set2/selection190
fi