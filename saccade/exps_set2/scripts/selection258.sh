#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection258/selection258.exp"
if [ -f $FPATH ]; then
	python experiment.py selection258 exps_set2/selection258
fi