#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection100/selection100.exp"
if [ -f $FPATH ]; then
	python experiment.py selection100 exps_set2/selection100
fi