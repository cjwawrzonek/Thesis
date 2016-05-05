#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection125/selection125.exp"
if [ -f $FPATH ]; then
	python experiment.py selection125 exps_set2/selection125
fi