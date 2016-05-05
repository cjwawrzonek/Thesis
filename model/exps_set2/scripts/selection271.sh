#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection271/selection271.exp"
if [ -f $FPATH ]; then
	python experiment.py selection271 exps_set2/selection271
fi