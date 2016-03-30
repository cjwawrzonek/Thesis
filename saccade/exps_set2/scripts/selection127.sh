#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection127/selection127.exp"
if [ -f $FPATH ]; then
	python experiment.py selection127 exps_set2/selection127
fi