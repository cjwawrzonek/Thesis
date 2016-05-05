#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection278/selection278.exp"
if [ -f $FPATH ]; then
	python experiment.py selection278 exps_set2/selection278
fi