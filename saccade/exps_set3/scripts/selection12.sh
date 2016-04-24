#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection12/selection12.exp"
if [ -f $FPATH ]; then
	python experiment.py selection12 exps_set3/selection12
fi