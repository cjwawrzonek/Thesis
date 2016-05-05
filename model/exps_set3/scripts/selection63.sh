#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection63/selection63.exp"
if [ -f $FPATH ]; then
	python experiment.py selection63 exps_set3/selection63
fi