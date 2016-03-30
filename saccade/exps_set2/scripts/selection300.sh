#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection300/selection300.exp"
if [ -f $FPATH ]; then
	python experiment.py selection300 exps_set2/selection300
fi