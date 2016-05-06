#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection26/selection26.exp"
if [ -f $FPATH ]; then
	python experiment.py selection26 exps_set4/selection26
fi