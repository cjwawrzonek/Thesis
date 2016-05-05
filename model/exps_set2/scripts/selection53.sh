#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection53/selection53.exp"
if [ -f $FPATH ]; then
	python experiment.py selection53 exps_set2/selection53
fi