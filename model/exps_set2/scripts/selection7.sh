#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection7/selection7.exp"
if [ -f $FPATH ]; then
	python experiment.py selection7 exps_set2/selection7
fi