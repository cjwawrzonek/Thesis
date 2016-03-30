#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection222/selection222.exp"
if [ -f $FPATH ]; then
	python experiment.py selection222 exps_set2/selection222
fi