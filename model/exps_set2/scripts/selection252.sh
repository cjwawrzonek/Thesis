#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection252/selection252.exp"
if [ -f $FPATH ]; then
	python experiment.py selection252 exps_set2/selection252
fi