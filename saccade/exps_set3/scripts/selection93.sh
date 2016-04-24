#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection93/selection93.exp"
if [ -f $FPATH ]; then
	python experiment.py selection93 exps_set3/selection93
fi