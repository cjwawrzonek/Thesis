#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection75/selection75.exp"
if [ -f $FPATH ]; then
	python experiment.py selection75 exps_set3/selection75
fi