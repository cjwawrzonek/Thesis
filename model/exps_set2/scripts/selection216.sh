#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection216/selection216.exp"
if [ -f $FPATH ]; then
	python experiment.py selection216 exps_set2/selection216
fi