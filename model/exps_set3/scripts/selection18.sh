#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection18/selection18.exp"
if [ -f $FPATH ]; then
	python experiment.py selection18 exps_set3/selection18
fi