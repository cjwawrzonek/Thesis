#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection35/selection35.exp"
if [ -f $FPATH ]; then
	python experiment.py selection35 exps_set3/selection35
fi